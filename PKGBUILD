# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-causal-conv1d
pkgver=1.7.0
pkgrel=1
pkgdesc='Causal depthwise conv1d in CUDA with a PyTorch interface'
arch=('x86_64')
url='https://github.com/Dao-AILab/causal-conv1d'
license=('BSD-3-Clause')
depends=(
  'cuda'
  'glibc'
  'libgcc'
  'libstdc++'
  'ninja'
  'python'
  'python-packaging'
  'python-pytorch-cuda'
  'python-triton'
)
makedepends=(
  'gcc15'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-einops'
  'python-pytest'
)
options=('!debug' '!lto')
_pkgname=causal_conv1d
_archive="causal-conv1d-${pkgver}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'cpu-only-test-skip.patch'
)
sha256sums=(
  '708bacd4fb4ef6cad3999c9360e2a0f9521f556748a745b60f746b275db73c09'
  'a46fd9e2dfe11091cf50e66890fe474357b5879c020fbaeb05550a6fd05a141a'
)

prepare() {
  cd "${srcdir}/${_archive}"

  # Every upstream test in this file allocates CUDA tensors. Mark the complete
  # kernel suite as a hardware skip on CPU-only builders while still collecting
  # every parametrized case and loading the freshly built extension.
  patch -Np1 --fuzz=0 -i "$srcdir/cpu-only-test-skip.patch"
}

build() {
  cd "${srcdir}/${_archive}"

  # Force a fresh from-source build instead of letting setup.py fetch the
  # upstream prebuilt CUDA wheel from GitHub releases (forbidden — no prebuilt
  # binaries). This compiles the bundled CUDA kernels against the local
  # python-pytorch / cuda toolchain.
  export CAUSAL_CONV1D_FORCE_BUILD=TRUE
  export CUDA_HOME=/opt/cuda
  export PATH="$CUDA_HOME/bin:$PATH"

  # setup.py supplies upstream's complete explicit CUDA target matrix, including
  # the CUDA-13.0 additions (SM103/110/121), so no GPU auto-detection is needed.

  # CUDA's nvcc requires the gcc 15 host compiler on current Arch (nvcc 13.x
  # rejects gcc 16's char8_t handling).
  export CC=gcc-15
  export CXX=g++-15

  # glog 0.7 moved its visibility markers to the GLOG_EXPORT/GLOG_NO_EXPORT/
  # GLOG_DEPRECATED macros (defined in glog/export.h). PyTorch's c10 logging pulls
  # the system <glog/logging.h> into these extension TUs without that macro defined
  # (it was built against the older GOOGLE_GLOG_DLL_DECL), so declarations like
  # `GLOG_EXPORT void SetEmailLogging(...)` fail to parse. Define them empty.
  # NB: torch's BuildExtension compiles the host .cpp TUs with the CFLAGS-derived
  # `compiler_so` flags (NOT CXXFLAGS), so the defines MUST be in CFLAGS to reach
  # them; set CXXFLAGS + NVCC_PREPEND_FLAGS too for the C++/CUDA (nvcc) paths.
  local _glog='-DGLOG_EXPORT= -DGLOG_NO_EXPORT= -DGLOG_DEPRECATED='
  export CFLAGS="${CFLAGS} ${_glog}"
  export CXXFLAGS="${CXXFLAGS} ${_glog}"
  export NVCC_PREPEND_FLAGS="${_glog} ${NVCC_PREPEND_FLAGS}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_archive}"

  local _check_root="$srcdir/causal-conv1d-check"
  rm -rf "$_check_root"
  python -m installer --destdir="$_check_root" dist/*.whl
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  # This is the complete upstream pytest suite. All collected cases are CUDA
  # kernel comparisons and are skipped by the narrow patch above on this CPU job.
  CUDA_VISIBLE_DEVICES='' \
  PYTHONPATH="$_check_root$_site_packages" \
    pytest -ra tests/test_causal_conv1d.py

  # Exercise the installed wheel's public reference implementation end to end
  # on CPU, including activation, state return, and autograd.
  CUDA_VISIBLE_DEVICES='' \
  PYTHONPATH="$_check_root$_site_packages" python - <<'PY'
import torch

import causal_conv1d
import causal_conv1d_cuda
from causal_conv1d.causal_conv1d_interface import causal_conv1d_ref

assert causal_conv1d.__version__ == "1.7.0"
assert callable(causal_conv1d_cuda.causal_conv1d_fwd)

x = torch.tensor([[[1.0, 2.0, 3.0, 4.0], [2.0, 1.0, 0.0, -1.0]]], requires_grad=True)
weight = torch.tensor([[1.0, 0.5], [0.25, -0.5]], requires_grad=True)
bias = torch.tensor([0.1, -0.2], requires_grad=True)
out, state = causal_conv1d_ref(
    x, weight, bias, return_final_states=True, activation="silu"
)
expected_linear = torch.tensor([[[0.6, 2.1, 3.6, 5.1], [-1.2, -0.2, 0.05, 0.3]]])
torch.testing.assert_close(out, torch.nn.functional.silu(expected_linear))
torch.testing.assert_close(state, x[..., -1:])
out.sum().backward()
for tensor in (x.grad, weight.grad, bias.grad):
    assert tensor is not None and torch.isfinite(tensor).all()
print({"version": causal_conv1d.__version__, "shape": tuple(out.shape)})
PY

  # Prove the extension contains the complete CUDA-13 target range selected in
  # build(), even though this worker has no NVIDIA device.
  local _extension _arch
  _extension=$(CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_check_root$_site_packages" \
    python -c 'import causal_conv1d_cuda; print(causal_conv1d_cuda.__file__)')
  cuobjdump --list-elf "$_extension" > "$srcdir/causal-conv1d-cuobjdump.txt"
  for _arch in 75 80 87 90 100 103 110 120 121; do
    grep -q "sm_$_arch" "$srcdir/causal-conv1d-cuobjdump.txt"
  done
}

package() {
  cd "${srcdir}/${_archive}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
