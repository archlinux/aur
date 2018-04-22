# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>

_commit=46f8583c87c45b304ac98d06005c49df67d53b07  # tags/1.42.1^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-pango
pkgver=1.42.1
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=('any')
url="http://www.pango.org"
license=('LGPL')
depends=('mingw-w64-harfbuzz'
         'mingw-w64-fribidi'
         'mingw-w64-fontconfig'
         'mingw-w64-freetype'
         'mingw-w64-cairo')
makedepends=('mingw-w64-configure'
             'gtk-doc'
             'gobject-introspection'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://git.gnome.org/browse/pango#commit=${_commit}"
        "0001-no-unconditional-xft-please.all.patch")
sha256sums=('SKIP'
            'bebab6128258d300e677df0751177f5c30235d0a49c150d97987d0f00b309f35')

pkgver() {
  cd "${srcdir}/pango"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/pango"
  patch -p1 -i ${srcdir}/0001-no-unconditional-xft-please.all.patch
  NOCONFIGURE=1 ./autogen.sh
  sed -i 's/have_libthai=true/have_libthai=false/' configure
}

build() {
  cd "${srcdir}/pango"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-introspection \
      --disable-debug
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pango/build-${_arch}"
    make -j1 DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
