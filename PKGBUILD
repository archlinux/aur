# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-hicolor-icon-theme
pkgver=0.15
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme (mingw-w64)"
arch=(any)
url="http://icon-theme.freedesktop.org/wiki/HicolorTheme"
license=('GPL')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("http://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz")
sha256sums=('9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc')

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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    cd ..
  done
}
