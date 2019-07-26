# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-babl
pkgver=0.1.68
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (mingw-w64)"
arch=('any')
url="http://gegl.org/babl/"
license=('LGPL3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'git' 'librsvg')
options=('!strip' '!buildflags' 'staticlibs')
_commit=("d725728eb4fe44e6e766e971c35d41e658e4b46d")
source=("git+https://gitlab.gnome.org/GNOME/babl.git#commit=${_commit}")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/babl
  autoreconf -fiv
}

build() { 
  cd ${srcdir}/babl
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/babl/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}${MINGW_PREFIX}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/babl-*/*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/babl-*/*.a
  done
}
