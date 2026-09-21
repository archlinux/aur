# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-scatter
pkgver=2.1.2
pkgrel=3
pkgdesc='PyTorch Extension Library of Optimized Scatter Operations'
arch=('x86_64')
url='https://github.com/rusty1s/pytorch_scatter'
license=('MIT')
depends=('python' 'python-pytorch-cuda' 'cuda')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'gcc15')
checkdepends=('python-pytest')
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
  export CUDA_HOME=/opt/cuda
  # The build node has no GPU, so torch can't auto-detect the CUDA arch list and
  # crashes with "IndexError: list index out of range" computing arch flags. Set
  # the FULL supported arch range explicitly (Turing->Blackwell) — this is broad
  # coverage matching torch/CUDA defaults, NOT a narrowing (rule #9).
  export TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6;8.9;9.0;10.0;12.0"
  # CUDA's nvcc requires the gcc 15 host compiler on current Arch.
  export CC=gcc-15
  export CXX=g++-15

  # Tell glog's current headers to include their generated export definitions.
  # PyTorch's c10 headers otherwise enter glog through the legacy macro path.
  local _glog='-DGLOG_USE_GLOG_EXPORT'
  export CXXFLAGS="${CXXFLAGS} ${_glog}"
  export NVCC_PREPEND_FLAGS="${_glog} ${NVCC_PREPEND_FLAGS}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  local site_packages
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  rm -rf "$srcdir/_check" "$srcdir/_test-run"
  python -m installer --destdir="$srcdir/_check" dist/*.whl
  install -d "$srcdir/_test-run"
  cp -a test "$srcdir/_test-run/"
  cd "$srcdir/_test-run"

  # The package contains both CPU and complete CUDA extensions. On this CPU
  # build node, upstream automatically exercises every CPU dtype/reduction and
  # skips only the hardware-gated multi-GPU cases.
  CUDA_VISIBLE_DEVICES= \
  PYTHONPATH="$srcdir/_check$site_packages" \
    pytest -o pythonpath='' test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
