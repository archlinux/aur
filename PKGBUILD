# Maintainer: Jack O'Sullivan <jackos1998 at gmail dot com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_apkurl="https://git.alpinelinux.org/cgit/aports/plain/community/portablexdr"

pkgname=mingw-w64-portablexdr
pkgver=4.9.1
pkgrel=1
pkgdesc="external data representation (XDR) library"
arch=('any')
url="http://people.redhat.com/~rjones/portablexdr/"
license=('GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("${url}/files/portablexdr-${pkgver}.tar.gz"
		"${_apkurl}/portablexdr-${pkgver}-no-config-h.patch"
		"${_apkurl}/portablexdr-build-use-intptr_t-and-uintptr_t-to-cast-ptr-to-int.patch"
		"${_apkurl}/quad-types.patch")

sha256sums=('5cf4bdd153cf4d44eaf10b725f451d0cfadc070b4b9a9ccfb64094b8f78de72c'
            '75cec27cba9d667d4e137f13fb8e66a3a91344f458691e93d13928f5891216b9'
            '7919d9157537552c34047f8423d3e923fcb79d097b796141d28e05d2c5b8b6e0'
            '2a75fff6a66cc99af987fe928600c38eb17bb5163e8346a7feafa7374c542ce2')

build() {
  cd "${srcdir}/portablexdr-${pkgver}"

  local src
  for src in "${source[@]}"; do
    pwd
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/portablexdr-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' | xargs -rtl1 ${_arch}-strip
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
