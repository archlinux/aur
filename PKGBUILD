# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-pango
pkgver=1.58.0
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=('any')
url="https://pango.gnome.org/"
license=('LGPL-2.1-or-later')
depends=('mingw-w64-harfbuzz'
         'mingw-w64-fribidi'
         'mingw-w64-fontconfig'
         'mingw-w64-freetype2'
         'mingw-w64-cairo'
         'mingw-w64-libthai')
makedepends=('glib2-devel'
             'gobject-introspection'
             'gtk-doc'
             'mingw-w64-poppler'
             'mingw-w64-meson'
             'mingw-w64-wine'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.gnome.org/GNOME/pango.git#tag=${pkgver}")
b2sums=('7dd0165514f32f1167c7960e3d92227570527732daf5f3fa4645e48f72657494df080d6e07f2f8bc0a3983a20888d1439d57a46d7feb406b18c7da000644ab69')

build() {
  export NEED_WINE=1
  cd "${srcdir}/pango"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=release \
      --default-library=both \
      -D 'fontconfig=enabled' \
      -D 'documentation=false' \
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
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
