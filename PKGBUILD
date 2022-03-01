# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-pango-static
pkgver=1.50.4
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=('any')
url="https://pango.gnome.org/"
license=('LGPL')
depends=('mingw-w64-harfbuzz'
         'mingw-w64-fribidi'
         'mingw-w64-fontconfig'
         'mingw-w64-freetype2'
         'mingw-w64-cairo'
         'mingw-w64-libthai')
makedepends=('gtk-doc'
             'gobject-introspection'
             'mingw-w64-poppler'
             'mingw-w64-meson'
             'mingw-w64-wine'
             'git')
provides=("mingw-w64-pango=$pkgver")
conflicts=('mingw-w64-pango')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.gnome.org/GNOME/pango.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/pango"
  sed -E -i -e "/subdir\('(utils|examples|tests)'\)/d" meson.build
}

build() {
  export NEED_WINE=1
  cd "${srcdir}/pango"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=release \
      --default-library=static \
      -D 'gtk_doc=false' \
      -D 'introspection=disabled' \
      ..
    ninja
    popd
  done
}

package() {
  export NEED_WINE=1
  for _arch in ${_architectures}; do
    cd "${srcdir}/pango/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' | xargs ${_arch}-strip -g
  done
}
