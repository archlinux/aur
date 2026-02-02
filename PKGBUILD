# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgbase=ola
pkgname=(ola ola-docs)
pkgver=0.10.9
pkgrel=10
pkgdesc='Open Lighting Architecture for controlling entertainment lighting equipment'
arch=(x86_64 aarch64)
url='https://www.openlighting.org'
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=()
makedepends=(avahi cppunit doxygen flake8 libftdi-compat liblo libmicrohttpd ncurses protobuf
  protobuf-21 util-linux-libs)
checkdepends=(python-numpy python-protobuf-21)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/OpenLightingProject/$pkgbase/archive/refs/tags/$pkgver.tar.gz"
        "fix-protobuf-v20.patch::https://github.com/OpenLightingProject/$pkgbase/pull/1875.patch"
        "fix-liblo.patch::https://github.com/OpenLightingProject/$pkgbase/pull/1954.patch"
        'fix-build-with-gcc-14.patch'
        'event-loop-test-timings.patch')
sha256sums=('d2a80d907f5a0a5169583060bd32aa0fdbb2fdfe18d1194dd922595ab6d447b5'
            '6e57bb39c94981f62da6cd6b5c2744ace8ebe4b7b9fa8ee383800c1e3b8d6742'
            '3a85761affce7e6c1ea5bdc29b6c1774e8d3a2cc4bb6fc52daac871cf72cf3ca'
            '35915faad416d4b555132cc0348e39a921f5857475562a6742f46236491feef5'
            '1ea121955e09fa5a8c3f67ba8fb27d51a8137c8c3b82d238839e11e90efbdca0')
options=(!lto)

prepare() {
  cd $pkgbase-$pkgver
  # https://github.com/OpenLightingProject/ola/pull/1875
  patch -Np1 -i "$srcdir"/fix-protobuf-v20.patch
  # https://github.com/OpenLightingProject/ola/pull/1954
  patch -Np1 -i "$srcdir"/fix-liblo.patch
  patch -Np1 -i "$srcdir"/fix-build-with-gcc-14.patch
  # Make event loop tests timing checks more forgiving so they pass in CI
  patch -Np1 -i "$srcdir"/event-loop-test-timings.patch
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
              'python-protobuf-21: for python bindings')
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
