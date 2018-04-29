# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-hicolor-icon-theme
pkgver=0.17
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme (mingw-w64)"
arch=('any')
url="https://wiki.freedesktop.org/www/Software/icon-theme/"
license=('GPL')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-${pkgver}.tar.xz")
sha256sums=('317484352271d18cbbcfac3868eab798d67fff1b8402e740baa6ff41d588a9d8')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}/hicolor-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-configure"
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/hicolor-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
