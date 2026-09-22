# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-mamba-ssm
pkgver=2.3.2.post1
pkgrel=2
pkgdesc='Mamba state-space model: selective-scan SSM layers with CUDA kernels'
arch=('x86_64')
url='https://github.com/state-spaces/mamba'
license=('Apache-2.0')
depends=(
  'cuda'
  'glibc'
  'libgcc'
  'libstdc++'
  'ninja'
  'python'
  'python-einops'
  'python-huggingface-hub'
  'python-packaging'
  'python-pytorch-cuda'
  'python-setuptools'
  'python-transformers'
  'python-triton>=3.5.0'
)
makedepends=(
  'gcc15'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'python-causal-conv1d: optimized CUDA short-convolution backend'
  'python-tilelang: Mamba-3 MIMO kernels (upstream targets tilelang 0.1.8)'
  'python-apache-tvm-ffi: Mamba-3 CuTe step function (upstream requires <=0.1.9)'
  'python-quack-kernels: Mamba-3 CuTe helpers (quack-kernels>=0.3.4)'
  'python-cutlass: Mamba-3 CuTe DSL'
  'python-cuda: Mamba-3 CuTe CUDA driver bindings'
)
options=('!debug' '!lto')
_pkgname=mamba_ssm
_archive="mamba-${pkgver}"
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/state-spaces/mamba/archive/refs/tags/v${pkgver}.tar.gz"
  'optional-mamba3-dependencies.patch'
)
sha256sums=(
  'a49423a64dfccc5c46d8ba6c0fb50a3a8e48eee3e4c65b880b9fad5ac47383c2'
  '73accc816d48a3d6a61759e7c94009e3fca54011938eb611db8017ae41c51e39'
)

prepare() {
  cd "${srcdir}/${_archive}"

  # Mamba-3 imports both its TileLang MIMO backend and its CuTe decode backend
  # behind ImportError guards and gives targeted errors only when those features
  # are requested. Reflect that runtime behavior in wheel metadata; Arch users
  # can install either optional backend without forcing mutually constrained DSLs
  # on the core Mamba-1/2 and Mamba-3 SISO paths.
  patch -Np1 --fuzz=0 -i "$srcdir/optional-mamba3-dependencies.patch"
  # Current PyTorch headers require C++20 for both host and CUDA extensions.
  sed -i 's/-std=c++17/-std=c++20/g' setup.py
}

build() {
  cd "${srcdir}/${_archive}"

  # Force a fresh from-source build instead of letting setup.py fetch the
  # upstream prebuilt CUDA wheel from GitHub releases (forbidden — no prebuilt
  # binaries). This compiles the bundled selective-scan CUDA kernels against the
  # local python-pytorch / cuda toolchain.
  export MAMBA_FORCE_BUILD=TRUE
  # Arch installs the toolkit outside /usr; isolated builds do not source
  # /etc/profile.d/cuda.sh before PyTorch searches for nvcc.
  export CUDA_HOME=/opt/cuda
  export PATH="$CUDA_HOME/bin:$PATH"

  # setup.py supplies upstream's complete explicit CUDA target matrix, including
  # the CUDA-13 additions SM103, SM110, and SM121.

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

  # mamba-ssm's pyproject lists the PyPI 'ninja' module in build-system.requires.
  # We compile with the system ninja binary (makedepends) via torch's
  # BuildExtension, and the PyPI ninja module isn't installed (no pip allowed),
  # so skip the build-system requirement check rather than pull the module.
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${srcdir}/${_archive}"

  local _check_root="$srcdir/mamba-check"
  rm -rf "$_check_root"
  python -m installer --destdir="$_check_root" dist/*.whl
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  # Account for the complete upstream suite. The explicitly ignored files all
  # allocate CUDA tensors or compile GPU-only Triton/TileLang/CuTe kernels. The
  # two remaining files contain upstream's own CPU-job CUDA guards and are fully
  # collected below, yielding precise per-test hardware skips.
  CUDA_VISIBLE_DEVICES='' \
  PYTHONPATH="$_check_root$_site_packages" \
    pytest -ra tests \
      --ignore=tests/ops/cute/test_mamba3_mimo_step.py \
      --ignore=tests/ops/test_selective_scan.py \
      --ignore=tests/ops/tilelang/test_mamba3_mimo.py \
      --ignore=tests/ops/triton/test_layernorm_gated.py \
      --ignore=tests/ops/triton/test_mamba3_siso.py \
      --ignore=tests/ops/triton/test_selective_state_update.py \
      --ignore=tests/ops/triton/test_ssd.py \
      --ignore=tests/test_generation.py

  # Run a representative selective state-space scan with the installed wheel's
  # public PyTorch reference implementation, compare every step against an
  # independent recurrence, return state, and exercise autograd on CPU.
  CUDA_VISIBLE_DEVICES='' \
  PYTHONPATH="$_check_root$_site_packages" python - <<'PY'
import torch

import mamba_ssm
import selective_scan_cuda
from mamba_ssm.ops.selective_scan_interface import selective_scan_ref

assert mamba_ssm.__version__ == "2.3.2.post1"
assert callable(selective_scan_cuda.fwd)

u = torch.tensor([[[1.0, 2.0, -1.0], [0.5, 1.0, 1.5]]], requires_grad=True)
delta = torch.tensor([[[0.2, 0.3, 0.1], [0.4, 0.2, 0.5]]], requires_grad=True)
A = torch.tensor([[-0.5, -1.0], [-0.25, -0.75]], requires_grad=True)
B = torch.tensor([[0.7, -0.2], [0.5, 0.3]], requires_grad=True)
C = torch.tensor([[1.2, -0.4], [0.8, 0.6]], requires_grad=True)
out, last = selective_scan_ref(u, delta, A, B, C, return_last_state=True)

state = torch.zeros(1, 2, 2)
expected = []
for step in range(u.shape[-1]):
    state = torch.exp(delta[:, :, step, None] * A) * state
    state = state + delta[:, :, step, None] * B * u[:, :, step, None]
    expected.append((state * C).sum(-1))
expected = torch.stack(expected, dim=-1)
torch.testing.assert_close(out, expected)
torch.testing.assert_close(last, state)
out.square().sum().backward()
for tensor in (u.grad, delta.grad, A.grad, B.grad, C.grad):
    assert tensor is not None and torch.isfinite(tensor).all()
print({"version": mamba_ssm.__version__, "output": out.detach().tolist()})
PY

  local _extension _arch
  _extension=$(CUDA_VISIBLE_DEVICES='' PYTHONPATH="$_check_root$_site_packages" \
    python -c 'import selective_scan_cuda; print(selective_scan_cuda.__file__)')
  cuobjdump --list-elf "$_extension" > "$srcdir/mamba-cuobjdump.txt"
  for _arch in 75 80 87 90 100 103 110 120 121; do
    grep -q "sm_$_arch" "$srcdir/mamba-cuobjdump.txt"
  done
}

package() {
  cd "${srcdir}/${_archive}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
