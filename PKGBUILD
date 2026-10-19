# Maintainer: Brian Bidulock <bidulock@openss7.org>
# vim:set ts=2 sw=2 et:
pkgname=libbgp
pkgver=0.6.3
pkgrel=1
pkgdesc="A C++ BGP library."
arch=('x86_64' 'aarch64')
url="https://github.com/Nat-Lab/libbgp"
license=('MIT')
depends=(glibc libgcc libstdc++)
makedepends=(doxygen graphviz)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/0.6.3.tar.gz)
b2sums=('9207b8e01e6aa91d74ff1b1c4a91b6b8e0121b53a6d65c406a27a83b7b8eb5eaa16587a644b682724e97dde7c5d7f931c47e842d8be79890c669630b38e6f351')
_srcname=$pkgname-$pkgver

prepare() {
  cd $_srcname
  sed -i -e '/AX_CHECK_COMPILE_FLAG/d' configure.ac
  ./autogen.sh
}

build() {
  cd $_srcname
  export CXXFLAGS="-std=c++0x $CXXFLAGS"
  ./configure --prefix=/usr
  make V=1
  doxygen
}

package() {
  cd $_srcname
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname/"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
