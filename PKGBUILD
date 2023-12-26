# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_project=ucx
_pkgname=openucx
pkgname=$_pkgname-gpu
pkgver=1.15.0
pkgrel=1
pkgdesc="Communication framework for data-centric and high-performance applications"
arch=(x86_64)
url="http://www.openucx.org"
license=('BSD')
depends=(
  binutils
  glibc
  zlib
  zstd
)
makedepends=(
  rdma-core
  cuda
  rocm-language-runtime
)
optdepends=(
  'rdma-core: for InfiniBand and RDMA support'
  'cuda: for CUDA support'
  'rocm-language-runtime: for ROCm support'
)
provides=(
  $_pkgname
  libucm.so
  libucp.so
  libucs.so
  libucs_signal.so
  libuct.so
)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/openucx/$_project/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3082101dd61b2482390e7917b390f0fe9ecf399a839d97ee025ee559e6cb12d')

build() {
  cd $_project-$pkgver
  ./autogen.sh
  # NOTE: upstream suggests running ./contrib/configure-release instead of
  # ./configure for maximal performance, but it contains options that would
  # make debugging much harder
  ./configure \
      --prefix=/usr \
      --with-cuda=/opt/cuda \
      --with-rocm=/opt/rocm \
      --with-verbs \
      --with-rc \
      --with-ud \
      --with-dc \
      --with-mlx5-dv
  make
}

package() {
  cd $_project-$pkgver
  make DESTDIR="$pkgdir" install

  # install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
