# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Philip A Reimer < antreimer at gmail dot com >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-xz
pkgver=5.2.4
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (mingw-w64)"
arch=('any')
url="https://tukaani.org/xz"
license=('custom' 'GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("${url}/xz-${pkgver}.tar.gz"{,.sig})
sha256sums=('b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145'
            'SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>

build() {
  cd "${srcdir}/xz-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/xz-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm "${pkgdir}/usr/${_arch}/bin/"{lz{cmp,diff,egrep,fgrep,grep,less,more},xz{cmp,diff,egrep,fgrep,grep,less,more}}
    rm -r "${pkgdir}/usr/${_arch}/share"
  done
}

# vim:set ts=2 sw=2 et:
