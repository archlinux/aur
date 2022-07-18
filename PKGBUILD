# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=ola
pkgname=(ola ola-docs)
pkgver=0.10.8
pkgrel=7
pkgdesc='Open Lighting Architecture for controlling entertainment lighting equipment'
arch=(x86_64 aarch64)
url='https://www.openlighting.org'
license=(LGPL2.1 GPL2)
depends=()
makedepends=(avahi cppunit doxygen flake8 libftdi-compat liblo libmicrohttpd ncurses protobuf
  python-numpy python-protobuf util-linux-libs)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/OpenLightingProject/$pkgbase/archive/refs/tags/$pkgver.tar.gz"
        "fix-crash.patch::https://github.com/OpenLightingProject/$pkgbase/commit/c818692.patch"
        "fix-tests.patch::https://github.com/OpenLightingProject/$pkgbase/pull/1757.patch")
sha256sums=('45bc101d1ddcc1c6320c063eb25a9345e5820a4233acfa5b29f2dfd99f7452e1'
            '6dfa80507a3c6422e8b870dd24345021b2bbff8bd13a06fce2b9fe2ef9883aa5'
            'cfe0647ed23d064bfe5fae108b1c5d3461a0475cfd5a902012b43813c07aae46')

prepare() {
  cd $pkgbase-$pkgver
  # https://github.com/OpenLightingProject/ola/pull/1753
  patch -p1 -i ../fix-crash.patch
  # https://github.com/OpenLightingProject/ola/pull/1757
  patch -p1 -i ../fix-tests.patch
}

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
  make check || (cat ./test-suite.log && false)
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
