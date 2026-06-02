# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-mamba-ssm
pkgver=2.3.2.post1
pkgrel=1
pkgdesc='Mamba state-space model: selective-scan SSM layers with CUDA kernels'
arch=('x86_64')
url='https://github.com/state-spaces/mamba'
license=('Apache-2.0')
depends=('python' 'python-pytorch' 'python-causal-conv1d' 'python-triton'
         'python-einops' 'python-huggingface-hub' 'python-transformers')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-packaging' 'cuda' 'gcc15' 'ninja')
optdepends=('python-tilelang: Mamba-3 fused tilelang kernels'
            'python-apache-tvm-ffi: Mamba-3 CuTe step-function (tvm-ffi backend)'
            'python-cuda: Mamba-3 CuTe step-function (CUDA driver bindings)')
_pkgname=mamba_ssm
source=("https://files.pythonhosted.org/packages/source/m/mamba-ssm/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('104cc47e9101e5401a675fa2b784f2952b9b037f3b1dd83b5ac544394e95d028')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Force a fresh from-source build instead of letting setup.py fetch the
  # upstream prebuilt CUDA wheel from GitHub releases (forbidden — no prebuilt
  # binaries). This compiles the bundled selective-scan CUDA kernels against the
  # local python-pytorch / cuda toolchain.
  export MAMBA_FORCE_BUILD=TRUE

  # The build node has no GPU, so torch can't auto-detect the CUDA arch list and
  # crashes with "IndexError: list index out of range" computing arch flags. Set
  # the FULL supported arch range explicitly (Turing->Blackwell) — this is broad
  # coverage matching torch/CUDA defaults, NOT a narrowing (rule #9).
  export TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6;8.9;9.0;10.0;12.0"

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

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
