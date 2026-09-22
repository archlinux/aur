# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-transformer-engine
_pkgname=TransformerEngine
pkgver=2.18
pkgrel=1
pkgdesc='NVIDIA Transformer Engine: accelerated transformer training/inference with FP8 on Hopper+ GPUs (PyTorch backend)'
arch=('x86_64')
url='https://github.com/NVIDIA/TransformerEngine'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-pytorch-cuda>=2.1'
  'python-pydantic'
  'python-importlib-metadata>=1.0'
  'python-packaging'
  'python-numpy'
  'python-onnx'
  'python-onnxscript'
  'python-nvdlfw-inspect'
  'python-triton'
  'python-einops'
  'python-cudnn-frontend>=1.25.0'
  'glibc'
  'libgcc'
  'libstdc++'
  'cuda>=12.1'
  'cudnn>=9.3'
  'nccl>=2.30.4'
  'nvidia-utils'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0'
  'cmake>=3.21'
  'ninja'
  'pybind11'
  'gcc15'
  'git'
  'cudnn-frontend>=1.25.0'
)
checkdepends=('python-pytest>=8.2.1')
# Git sources: main repo at the release tag plus every pinned submodule. The
# sdist/PyPI package is only a metapackage, so the full source tree is required.
source=(
  "git+https://github.com/NVIDIA/TransformerEngine.git#tag=v${pkgver}"
  "te-cutlass::git+https://github.com/NVIDIA/cutlass.git#commit=57e3cfb47a2d9e0d46eb6335c3dc411498efa198"
  "te-googletest::git+https://github.com/google/googletest.git#commit=f8d7d77c06936315286eb55f8de22cd23c188571"
  "te-nccl::git+https://github.com/NVIDIA/nccl.git#commit=b87848fbc52da65b5a898b4ac6633fcf51cec4ed"
  'nccl-ep-nvcc-ldflags.patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ac5da038fc3a317080130b573b56700f911898559777d4b8867d57332251ce4d')

prepare() {
  cd "${_pkgname}"
  # Wire the pinned submodules from the locally-fetched git sources.
  git submodule init
  git config submodule.3rdparty/cutlass.url "${srcdir}/te-cutlass"
  git config submodule.3rdparty/googletest.url "${srcdir}/te-googletest"
  git config submodule.3rdparty/nccl.url "${srcdir}/te-nccl"
  git -c protocol.file.allow=always submodule update

  # cuDNN frontend is now a distribution dependency, not a git submodule.
  # Arch separates its development headers into cudnn-frontend under /usr.
  sed -i 's|Path(distribution(package).locate_file("include")).resolve()|Path("/usr/include")|' \
    build_tools/utils.py

  # NCCL-EP cannot safely relink its CUDA registration glue with host LTO and
  # nvcc cannot consume -Wl,... directly. Fix only that isolated subprocess.
  patch -Np1 -i "${srcdir}/nccl-ep-nvcc-ldflags.patch"

  # `python -m build --no-isolation` still verifies build-system.requires as pip
  # distributions. cmake/ninja/pybind11 are provided by pacman (makedepends) and
  # jax/flax aren't needed for the pytorch backend, so trim build-requires to the
  # ones pip actually resolves here.
  sed -i 's|^requires = \[.*\]|requires = ["setuptools>=61.0", "wheel", "torch>=2.1"]|' pyproject.toml

  # NCCL-EP bypasses PyTorch's build helper and otherwise uses every host CPU,
  # ignoring both process affinity and the standard MAX_JOBS build limit.
  sed -i \
    's/nproc = os.cpu_count() or 8/nproc = int(os.getenv("MAX_JOBS", len(os.sched_getaffinity(0))))/' \
    setup.py
  grep -Fq 'nproc = int(os.getenv("MAX_JOBS"' setup.py
}

build() {
  cd "${_pkgname}"
  export CUDA_HOME=/opt/cuda
  export NCCL_HOME=/usr
  export PATH="/opt/cuda/bin:${PATH}"
  # nvcc 13.x needs gcc<=15 as host compiler.
  export CC=/usr/bin/gcc-15 CXX=/usr/bin/g++-15
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  # Build only the PyTorch backend.
  export NVTE_FRAMEWORK=pytorch
  # The AUR package version identifies the tagged release; do not append the
  # transient Git worktree commit as a PEP 440 local-version suffix.
  export NVTE_NO_LOCAL_VERSION=1
  # Preserve TE's complete CUDA 13 default architecture range. Volta (7.0) is
  # omitted only because CUDA 13 no longer supports it.
  export NVTE_CUDA_ARCHS="${NVTE_CUDA_ARCHS:-75;80;89;90;100;120}"
  # glog 0.7 compat for the torch-binding compile (torch headers pull glog).
  export CPPFLAGS="-DGLOG_USE_GLOG_EXPORT ${CPPFLAGS:-}"
  export NVCC_PREPEND_FLAGS="-ccbin /usr/bin/g++-15 -DGLOG_USE_GLOG_EXPORT"
  export NVTE_CMAKE_EXTRA_ARGS="-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15"
  # Preserve the scheduler/harness limit: nproc honors OMP_NUM_THREADS=1,
  # which intentionally limits test kernels but must not serialize builds.
  export MAX_JOBS="${MAX_JOBS:-${SLURM_CPUS_PER_TASK:-$(nproc)}}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}"

  local _testroot="$srcdir/test-install"
  rm -rf "$_testroot"
  python -m installer --destdir="$_testroot" dist/*.whl
  local _site
  _site="$(find "$_testroot/usr/lib" -type d -name site-packages -print -quit)"
  test -n "$_site"

  # Upstream's CPU build CI gate. Run outside the source tree so only the
  # wheel payload can satisfy imports.
  (
    cd "$_testroot"
    PYTHONPATH="$_site" \
      python "$srcdir/${_pkgname}/tests/pytorch/test_sanity_import.py"

    # CPU-safe upstream debug-integration suite, including discovery of every
    # Transformer Engine feature through nvdlfw-inspect.
    PYTHONPATH="$_site" pytest -q \
      "$srcdir/${_pkgname}/tests/pytorch/debug/test_config.py" \
      --feature_dirs "$_site/transformer_engine/debug/features"

    # Upstream's remaining L0/L1 PyTorch tests execute CUDA kernels (and the
    # distributed group needs several GPUs), which are unavailable by design in
    # this CPU-only package build. Run every hardware-independent upstream test:
    # context-parallel tensor utilities, flex-attention cache bookkeeping,
    # deferred/meta initialization, and the CPU JIT kernels. The explicit node
    # IDs and -k exclusions name the CUDA-only cases in otherwise CPU-capable
    # files.
    PYTHONPATH="$_site:$srcdir/${_pkgname}/tests/pytorch" pytest -q \
      "$srcdir/${_pkgname}/tests/pytorch/attention/test_cp_utils.py" \
      "$srcdir/${_pkgname}/tests/pytorch/attention/test_flex_attention.py" \
      -k 'not test_dot_product_attention_score_mod'
    # The five remaining deferred-init variants inherit
    # TransformerEngineBaseModule, which intentionally raises when CUDA is not
    # available even for device="meta". LayerNorm and RMSNorm are the complete
    # hardware-independent part of this upstream test.
    PYTHONPATH="$_site:$srcdir/${_pkgname}/tests/pytorch" pytest -q \
      "$srcdir/${_pkgname}/tests/pytorch/test_deferred_init.py::TestDeferredInit::test_zero_memory_init[LayerNorm]" \
      "$srcdir/${_pkgname}/tests/pytorch/test_deferred_init.py::TestDeferredInit::test_zero_memory_init[RMSNorm]"
    PYTHONPATH="$_site:$srcdir/${_pkgname}/tests/pytorch" pytest -q \
      "$srcdir/${_pkgname}/tests/pytorch/test_jit.py" \
      -k 'test_lazy_compile or test_l2normalization_fused_correctness'

    # Exercise a hardware-independent public recipe operation. Kernel execution
    # is validated on installed NVIDIA hardware by users; the package build
    # itself remains CPU-only while compiling every upstream CUDA architecture.
    PYTHONPATH="$_site" python - <<'PY'
from importlib.metadata import version

from transformer_engine.common.recipe import DelayedScaling, Format

assert version("transformer_engine") == "2.18.0"

recipe = DelayedScaling(
    margin=2,
    fp8_format=Format.HYBRID,
    amax_history_len=16,
    amax_compute_algo="most_recent",
)
assert recipe.delayed()
assert recipe.fp8_format is Format.HYBRID
assert recipe.fp8_format.value.max_fwd == 448
assert recipe.fp8_format.value.max_bwd == 57344
assert recipe.amax_history_len == 16
assert "margin=2" in repr(recipe)
print(recipe)
PY
  )
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # The upstream wheel carries backend build helpers as importable modules.
  # They are not part of the installed API and would incorrectly turn
  # setuptools and wheel into runtime dependencies.
  rm \
    "${pkgdir}"/usr/lib/python*/site-packages/transformer_engine/{jax,pytorch}/setup.py

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
