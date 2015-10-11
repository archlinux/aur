# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-adwaita-icon-theme
pkgver=3.18.0
pkgrel=1
pkgdesc="Adwaita icon theme (mingw-w64)"
arch=(any)
url="http://www.gnome.org"
license=('GPL')
makedepends=(
  'mingw-w64-configure'
  'gtk3'
  'intltool'
  'librsvg')
depends=('mingw-w64-hicolor-icon-theme')
options=(!strip !buildflags staticlibs)
source=("https://download.gnome.org/sources/adwaita-icon-theme/${pkgver%.*}/adwaita-icon-theme-${pkgver}.tar.xz")
sha256sums=('5e9ce726001fdd8ee93c394fdc3cdb9e1603bbed5b7c62df453ccf521ec50e58')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/adwaita-icon-theme-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}/share/locale" -type d -empty -delete
    cd ..
  done
}
