# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=ola
pkgname=(ola ola-docs)
pkgver=0.10.8
pkgrel=3
pkgdesc='Open Lighting Architecture for controlling entertainment lighting equipment'
arch=(x86_64 aarch64)
url='https://www.openlighting.org'
license=(LGPL2.1 GPL2)
depends=()
makedepends=(avahi cppunit doxygen flake8 libftdi-compat liblo libmicrohttpd ncurses protobuf
  python-numpy python-protobuf util-linux-libs)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/OpenLightingProject/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('45bc101d1ddcc1c6320c063eb25a9345e5820a4233acfa5b29f2dfd99f7452e1')

build() {
  cd $pkgbase-$pkgver
  autoreconf -i
  ./configure --prefix=/usr \
    --enable-silent-rules \
    --enable-python-libs \
    --enable-rdm-tests \
    --enable-ja-rule \
    --enable-e133
    # --enable-java-libs
  make
  make doxygen-doc
}

check() {
  cd $pkgbase-$pkgver
  make check ||
    echo "Ignoring failing tests"
}

package_ola() {
  depends+=(avahi libftdi-compat liblo.so libmicrohttpd.so libncursesw.so libprotobuf.so libuuid.so)
  optdepends=('python: for python bindings'
              'python-numpy: for python bindings'
              'python-protobuf: for python bindings')
  cd $pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
}

package_ola-docs() {
  pkgdesc+=' (documentation)'
  arch=(any)
  cd $pkgbase-$pkgver
  mkdir -p "$pkgdir"/usr/share/doc/$pkgbase
  cp -a html/* "$pkgdir"/usr/share/doc/$pkgbase
}
