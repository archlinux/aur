# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Philip A Reimer < antreimer at gmail dot com >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_pkgname=xz
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-xz
pkgver=5.6.4
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (mingw-w64)"
arch=('any')
url="https://tukaani.org/xz/"
license=('custom' 'GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'git' 'po4a' 'doxygen')
options=('!strip' 'staticlibs' '!buildflags')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://github.com/tukaani-project/xz#tag=v${pkgver}")
b2sums=('264604298ee025ef01ec0439b6a339f25f4b18131b3f222eca2764df98bb41de5a22439b91349760b436b2ded31c132983cdcb277ec54b0097dd51063b4c0cd8')

prepare() {
  cd "${srcdir}/${_pkgname}"

  PATH=/usr/bin/vendor_perl:${PATH} ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
       --disable-nls
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm "${pkgdir}/usr/${_arch}/bin/"{lz{cmp,diff,egrep,fgrep,grep,less,more},xz{cmp,diff,egrep,fgrep,grep,less,more}}
    rm -r "${pkgdir}/usr/${_arch}/share"
  done
}

# vim:set ts=2 sw=2 et:
