# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=ola
pkgname=(ola ola-docs)
pkgver=0.10.9
pkgrel=7
pkgdesc='Open Lighting Architecture for controlling entertainment lighting equipment'
arch=(x86_64 aarch64)
url='https://www.openlighting.org'
license=(LGPL2.1 GPL2)
depends=()
makedepends=(avahi cppunit doxygen flake8 libftdi-compat liblo libmicrohttpd ncurses protobuf-21
  python-numpy python-protobuf util-linux-libs)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/OpenLightingProject/$pkgbase/archive/refs/tags/$pkgver.tar.gz"
        "fix-protobuf-v20.patch::https://github.com/OpenLightingProject/$pkgbase/pull/1875.patch"
        "fix-liblo.patch::https://github.com/OpenLightingProject/$pkgbase/pull/1954.patch")
sha256sums=('d2a80d907f5a0a5169583060bd32aa0fdbb2fdfe18d1194dd922595ab6d447b5'
            '6e57bb39c94981f62da6cd6b5c2744ace8ebe4b7b9fa8ee383800c1e3b8d6742'
            '3a85761affce7e6c1ea5bdc29b6c1774e8d3a2cc4bb6fc52daac871cf72cf3ca')
options=(!lto)

prepare() {
  cd $pkgbase-$pkgver
  # https://github.com/OpenLightingProject/ola/pull/1875
  patch -p1 -i ../fix-protobuf-v20.patch
  # https://github.com/OpenLightingProject/ola/pull/1954
  patch -Np1 -i ../fix-liblo.patch
}

build() {
  local config_options=(
    --prefix=/usr
    --enable-silent-rules
    --enable-python-libs
    --enable-rdm-tests
    --enable-ja-rule
    --enable-e133
    --with-protoc=protoc-21
    #--enable-java-libs
  )
  cd $pkgbase-$pkgver
  autoreconf -i
  export CXXFLAGS="$CXXFLAGS -I/usr/include/abseil-cpp11 -I/usr/include/protobuf-21"
  export LDFLAGS="$LDFLAGS -L/usr/lib/protobuf-21"
  ./configure "${config_options[@]}"
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
