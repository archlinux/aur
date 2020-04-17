# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >

pkgname=mingw-w64-dav1d
pkgver=0.6.0
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (mingw-w64)'
arch=('i686' 'x86_64')
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'git' 'nasm' 'doxygen')
source=(https://downloads.videolan.org/pub/videolan/dav1d/${pkgver}/dav1d-${pkgver}.tar.xz{,.asc}
        mingw-w64-stripping-fix.patch)
sha512sums=('aeee206806642188839602c7040340052d8cff2168fd142516499da1718c497b3b6b45f96af2d543a0db8ef5d26acece6ac9bb6c6e00316fa222a2ea0554581c'
            'SKIP'
            '04dba9898475550243b6edd7dade239f67c132f0bc5c0f2ac57b60de1c9d22b5c3e4cec16aa00ad505b47d36142278bf36a1efc6c7f424c039cf1a7c87cb3cbf')
b2sums=('152f948a89584d706b80f1334a3d430b3a97715365228bab24b610a5742ec07b371503cae18d8df83a40c85599aa9d8bf0fc181ea5c355bf0f9e1bf541f066cd'
        'SKIP'
	'2a3228fe1f1cb7a20aa8f79ed4fb9c366e370a8c224d62208677eb47fcd932102f373ac7cea04aec16d797be6659dda97512cb500e04168a912f554519e34baa')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd "${srcdir}/dav1d-${pkgver}"

  patch -Np1 -i "${srcdir}/mingw-w64-stripping-fix.patch"
}

build () {
  export NEED_WINE=1
  export WINEDEBUG=-all
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/dav1d-${pkgver}/build-${_arch}" && cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    ${_arch}-meson .. --default-library both
    
    ninja
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    
    export WINEDEBUG=-all
    meson test
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    
    DESTDIR="$pkgdir" ninja install
  done

  cd "${srcdir}/dav1d-${pkgver}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 doc/PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
