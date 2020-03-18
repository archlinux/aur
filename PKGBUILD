# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-glibmm
pkgver=2.64.0
pkgrel=1
pkgdesc="C++ bindings for GLib (mingw-w64)"
arch=('any')
url="https://www.gtkmm.org/"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-libsigc++' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/glibmm/${pkgver%.*}/glibmm-${pkgver}.tar.xz")
sha256sums=('46e83d4a123e41784b3b04a7cdcfcdaf918ba8e7e05b2acb10be0e0c09883c12')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/glibmm-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-documentation \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/glibmm-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
