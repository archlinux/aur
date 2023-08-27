# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_project=ucx
_pkgname=openucx
pkgname=$_pkgname-gpu
pkgver=1.14.1
pkgrel=1
pkgdesc="Communication framework for data-centric and high-performance applications"
arch=(x86_64)
url="http://www.openucx.org"
license=('BSD')
depends=(
  libnuma.so
  libsframe.so
  libz.so
  libzstd.so
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
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/openucx/$_project/archive/refs/tags/v${pkgver}.tar.gz"
  "$_pkgname-fix-conflicting-types.patch::https://patch-diff.githubusercontent.com/raw/openucx/ucx/pull/8804.patch"
)
sha256sums=('e7e82d5812261b5a38f0ba72921b6e0c392f04e2663e740cccbbe11f691880ea'
            '9fbf26b39cd5c9e469ff152e18d79a4bf685fca175d4088b9bbe8644b74c1401')

prepare() {
  cd $_project-$pkgver
  patch -Np1 < ../$_pkgname-fix-conflicting-types.patch
}

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
