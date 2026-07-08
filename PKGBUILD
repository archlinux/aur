# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Philip A Reimer < antreimer at gmail dot com >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_pkgname=xz
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-xz
pkgver=5.8.3
pkgrel=1
pkgdesc="Library and command line tools for XZ and LZMA compressed files (mingw-w64)"
arch=('any')
url="https://tukaani.org/xz/"
license=("GPL-2.0-or-later AND 0BSD AND LicenseRef-Public-Domain AND LGPL-2.1-or-later")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'git' 'po4a' 'doxygen')
options=('!strip' 'staticlibs' '!buildflags')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
source=("git+https://github.com/tukaani-project/xz#tag=v${pkgver}")
b2sums=('a003d269db3174215d73c2112f343262034aa0d817aaad1bf8caf8f8d6561d49c2fcb03ad11dcc089beb6e9ba79f65e94b235f587977966a83238d5d640bb51e')

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
