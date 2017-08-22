# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-hicolor-icon-theme
pkgver=0.16
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme (mingw-w64)"
arch=(any)
url="https://wiki.freedesktop.org/www/Software/icon-theme/"
license=('GPL')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz")
sha256sums=('b0f8e770815fc80f7719d367608a2eb05572570cfca2734f986deae73e7d1f39')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/hicolor-icon-theme-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/hicolor-icon-theme-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtL1 ${_arch}-strip
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtL1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtL1 ${_arch}-strip -g
    cd ..
  done
}
