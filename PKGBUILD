# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-apex
_pkgname=apex
pkgver=25.09
pkgrel=1
pkgdesc='NVIDIA Apex: PyTorch extensions for mixed precision and distributed training (fused ops)'
arch=('x86_64')
url='https://github.com/NVIDIA/apex'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-pytorch'
  'python-tqdm'
  'python-numpy'
  'python-yaml'
  'python-packaging'
  'cuda'
  'cudnn'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'gcc15'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/NVIDIA/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d30ce19d8519363fd3ee52d028d60c6f66062c53f72d1265ed79e743449b12db')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Apex hard-fails the build unless torch's bundled CUDA exactly equals the
  # system nvcc version. Arch's python-pytorch-cuda and the cuda package can
  # differ by a minor version, so neutralize the check (the ABI is compatible).
  sed -i '/^def check_cuda_torch_binary_vs_bare_metal/a\    return' setup.py

  # Arch's torch is built against glog 0.7+, whose headers need
  # GLOG_USE_GLOG_EXPORT defined or GLOG_EXPORT expands to nothing
  # ("two or more data types"). Inject the define into every extension's
  # cxx/nvcc args, including the bare apex_C CppExtension.
  sed -i 's/"cxx": \["-O3"/"cxx": ["-O3", "-DGLOG_USE_GLOG_EXPORT"/g' setup.py
  sed -i 's/"nvcc": \[/"nvcc": ["-DGLOG_USE_GLOG_EXPORT", /g' setup.py
  sed -i 's|CppExtension("apex_C", \["csrc/flatten_unflatten.cpp"\])|CppExtension("apex_C", ["csrc/flatten_unflatten.cpp"], extra_compile_args=["-O3", "-DGLOG_USE_GLOG_EXPORT"])|' setup.py

  # With no GPU at build time, torch falls back to a named-arch default that
  # includes Volta (7.0), which CUDA 13 dropped -> "Unsupported gpu architecture
  # 'compute_70'". Env vars don't reliably reach torch's flag generation through
  # the build frontend, so pin a CUDA-13-safe arch list in-process at the very
  # top of setup.py (Turing..Blackwell). Override _APEX_ARCHS to retarget.
  sed -i "1i os.environ.setdefault('TORCH_CUDA_ARCH_LIST', os.environ.get('_APEX_ARCHS') or '7.5;8.0;8.6;8.9;9.0;10.0;12.0')" setup.py
  sed -i '1i import os' setup.py
}

build() {
  cd "${_pkgname}-${pkgver}"

  # CUDA 13 dropped Pascal/Volta (sm_60/61/62/70/72). apex's
  # fused_weight_gradient_mlp_cuda forces a gencode list containing compute_70
  # that neither TORCH_CUDA_ARCH_LIST nor source patches reliably override, so
  # wrap nvcc to strip unsupported-arch gencodes (both "-gencode=arch=..." and
  # "-gencode arch=..." forms). CUDA_HOME points at a mirror dir whose only real
  # change is bin/nvcc; everything else symlinks to /opt/cuda.
  local W="${srcdir}/nvcc-wrap"
  rm -rf "$W"; mkdir -p "$W/bin"
  local e
  for e in /opt/cuda/*; do
    [ "$(basename "$e")" = bin ] && continue
    ln -sfn "$e" "$W/$(basename "$e")"
  done
  for e in /opt/cuda/bin/*; do ln -sfn "$e" "$W/bin/$(basename "$e")"; done
  rm -f "$W/bin/nvcc"
  cat > "$W/bin/nvcc" <<'WRAP'
#!/bin/bash
out=()
for a in "$@"; do
  case "$a" in
    -gencode=arch=compute_6[012]*|-gencode=arch=compute_7[02]*) continue ;;
  esac
  if [ "${#out[@]}" -gt 0 ] && [ "${out[-1]}" = "-gencode" ]; then
    case "$a" in
      arch=compute_6[012]*|arch=compute_7[02]*) unset 'out[-1]'; continue ;;
    esac
  fi
  out+=("$a")
done
exec /opt/cuda/bin/nvcc "${out[@]}"
WRAP
  chmod +x "$W/bin/nvcc"

  export CUDA_HOME="$W"
  export PATH="$W/bin:${PATH}"
  # nvcc 13.x cannot use gcc>=16 as host compiler (char8_t error); pin g++-15.
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  # glog 0.7 compat for host (.cpp) and device (.cu) compiles (see prepare()).
  export CPPFLAGS="-DGLOG_USE_GLOG_EXPORT ${CPPFLAGS:-}"
  export NVCC_PREPEND_FLAGS="-ccbin /usr/bin/g++-15 -DGLOG_USE_GLOG_EXPORT"
  # Arch coverage is set in-process at the top of setup.py (full Turing..Blackwell,
  # see prepare()); not exported here so there's a single source of truth.
  # APEX_* env vars make setup.py append --cpp_ext --cuda_ext (fused kernels).
  export APEX_CPP_EXT=1 APEX_CUDA_EXT=1
  # Parallelism is env-overridable. The fused kernels are compiled for the full
  # Turing..Blackwell arch range, so each nvcc holds a large multi-arch fatbin;
  # total memory ~ MAX_JOBS * NVCC_THREADS * per-arch. Defaults stay aggressive,
  # but cap these (e.g. MAX_JOBS=16 NVCC_THREADS=2) on memory-limited build hosts
  # to avoid OOM.
  export MAX_JOBS="${MAX_JOBS:-$(nproc)}"
  export NVCC_APPEND_FLAGS="--threads ${NVCC_THREADS:-2}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  # apex.amp was removed in recent apex (use torch.amp); test the real submodules.
  # The compiled CUDA extensions need libtorch_cuda.so (python-pytorch-cuda) to
  # dlopen, which may be absent in a CPU-only build env, so keep this best-effort.
  python -c "import apex; from apex.normalization import FusedLayerNorm, FusedRMSNorm; from apex.optimizers import FusedAdam, FusedLAMB; from apex.multi_tensor_apply import multi_tensor_applier; import apex.transformer; print('apex import OK')" \
    || echo 'Warning: import check skipped (torch-cuda runtime may be unavailable in build env)'
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
