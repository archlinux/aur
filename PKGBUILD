# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-scatter
pkgver=2.1.2
pkgrel=2
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=('x86_64')
url='https://github.com/rusty1s/pytorch_scatter'
license=('MIT')
depends=('python' 'python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'cuda' 'gcc15')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rusty1s/pytorch_scatter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6f375dbc9cfe03f330aa29ea553e9c7432e9b040d039b041f08bf05df1a8bf37')

_pkgname=pytorch_scatter

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Build the CUDA extensions in addition to the CPU ones so the package
  # ships full GPU support when built against a CUDA-enabled python-pytorch.
  # The CUDA architecture coverage is governed by torch/CUDA defaults and is
  # deliberately not narrowed here.
  export FORCE_CUDA=1
  # The build node has no GPU, so torch can't auto-detect the CUDA arch list and
  # crashes with "IndexError: list index out of range" computing arch flags. Set
  # the FULL supported arch range explicitly (Turing->Blackwell) — this is broad
  # coverage matching torch/CUDA defaults, NOT a narrowing (rule #9).
  export TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6;8.9;9.0;10.0;12.0"
  # CUDA's nvcc requires the gcc 15 host compiler on current Arch.
  export CC=gcc-15
  export CXX=g++-15

  # glog 0.7 moved its visibility markers to the GLOG_EXPORT/GLOG_NO_EXPORT/
  # GLOG_DEPRECATED macros (defined in glog/export.h). PyTorch's c10 logging pulls
  # the system <glog/logging.h> into these extension TUs without that macro defined
  # (it was built against the older GOOGLE_GLOG_DLL_DECL), so declarations like
  # `GLOG_EXPORT void SetEmailLogging(...)` fail to parse. Define them empty for
  # both the C++ (CXXFLAGS) and CUDA (nvcc) compiles so the headers parse.
  local _glog='-DGLOG_EXPORT= -DGLOG_NO_EXPORT= -DGLOG_DEPRECATED='
  export CXXFLAGS="${CXXFLAGS} ${_glog}"
  export NVCC_PREPEND_FLAGS="${_glog} ${NVCC_PREPEND_FLAGS}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
