# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-adwaita-icon-theme
pkgver=43
pkgrel=1
pkgdesc="Adwaita icon theme (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('LGPL3')
makedepends=(
  'mingw-w64-configure'
  'gtk3'
  'librsvg')
depends=('mingw-w64-hicolor-icon-theme')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/adwaita-icon-theme/${pkgver%%.*}/adwaita-icon-theme-${pkgver}.tar.xz")
sha256sums=('2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a65fd721e88d505f970da32ec6')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-configure"
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
