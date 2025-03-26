# Maintainer: TheCyberArcher@protonmail.ch
# Contributor: lantw44 

pkgname=mingw-w64-adwaita-icon-theme
pkgver=47.0
pkgrel=1
pkgdesc="Adwaita icon theme (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('LGPL-3.0-only')
makedepends=(
  'mingw-w64-meson'
  'gtk3'
  'librsvg')
depends=('mingw-w64-hicolor-icon-theme')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/adwaita-icon-theme/${pkgver%%.*}/adwaita-icon-theme-${pkgver}.tar.xz")
sha256sums=('ad088a22958cb8469e41d9f1bba0efb27e586a2102213cd89cc26db2e002bdfe')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-meson"
    ninja
    cd ..
  done
}

package() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
