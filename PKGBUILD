# Maintainer: 173br <173brian at gmail dot com>
# Contributor: CloverGit <clovergit@hotmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
pkgname=mingw-w64-cairo-bootstrap
pkgver=1.18.4
pkgrel=5
pkgdesc="2D graphics library with support for multiple output devices (mingw-w64 bootstrap)"
_commit=4541e0cd3a751b85e52e2a83d02ac6145a5efa85 # tags/1.18.4^0
arch=(any)
url="http://cairographics.org/"
license=("LGPL" "MPL")
makedepends=(mingw-w64-meson git)
depends=(mingw-w64-pixman mingw-w64-glib2 mingw-w64-freetype2-bootstrap mingw-w64-fontconfig mingw-w64-libpng mingw-w64-lzo)
options=(!strip !buildflags staticlibs)
provides=(${pkgname%-bootstrap}=$pkgver)
conflicts=(${pkgname%-bootstrap})
source=("git+https://gitlab.freedesktop.org/cairo/cairo.git#commit=$_commit"
        "0026-create-argb-fonts.all.patch")
sha256sums=('8a879085c16cc9d95f7e51216a276d5eb659a080b26f2f6131962612b0c21075'
            '6db6c44fbdb4926d09afa978fe80430186c4b7b7d255059602b1f94c6a079975')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/cairo"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "${srcdir}/cairo"
  patch -p1 -i ${srcdir}/0026-create-argb-fonts.all.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/cairo/build-${_arch}"
    cd "${srcdir}/cairo/build-${_arch}"
    ${_arch}-meson \
      -D spectre=disabled \
      -D dwrite=disabled \
      -D freetype=enabled \
      -D fontconfig=enabled \
      -D tests=disabled \
      -D symbol-lookup=disabled \
      -D gtk_doc=false \
      -D lzo=disabled \
      --buildtype=release \
      --default-library=both ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/cairo/build-${_arch}" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
# vim: set sw=2 ts=2 et:
