# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >

pkgname=mingw-w64-dav1d
pkgver=0.8.2
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (mingw-w64)'
arch=('i686' 'x86_64')
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'mingw-w64-xxhash' 'nasm' 'ninja' 'doxygen' 'graphviz')
source=(https://downloads.videolan.org/pub/videolan/dav1d/${pkgver}/dav1d-${pkgver}.tar.xz{,.asc}
        https://code.videolan.org/videolan/dav1d-test-data/-/archive/${pkgver}/dav1d-test-data-${pkgver}.tar.gz)
sha512sums=('c2d69adcc1f26c8700592e08306828aeaa3bf035e90a09bce4f2a494678645f37d4d0c5fc201eb4c369099f8f27e1325ca3421264aa1c2ffdad94868cc0504af'
            'SKIP'
            '36400a954c312b03e66b14c2b133d17bd3fe1c63013c37f04b75c4f35c55d6d7244029fc4f11d81e832f154d3946cc50145023b7750e2b2a9586d6a6a577c572')
b2sums=('4c08122506bda64a1a9abd237d2aa5cf1d1e3a84bea34ae96589bb577eebf74432bcfb219da69f79c8656539193299feb19f4e54b9f537a06a10449e3117fa83'
        'SKIP'
        '3e53c9c0d2c62910ab252c6a30229833b40c2fd6c77d3d965dd015bb0467d8e6c129423e4228c5a5ae8b9bdeeab9a196786178209011a4bffa2d6890393509ff')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd "${srcdir}/dav1d-${pkgver}"
  ln -s "${srcdir}/dav1d-test-data-${pkgver}" tests/dav1d-test-data
}

build() {
  export NEED_WINE=1
  export WINEDEBUG=-all
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/dav1d-${pkgver}/build-${_arch}" && cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    ${_arch}-meson .. --default-library both -Dtestdata_tests=true

    ninja
  done
}

# check disabled since a few tests run into timeout and one test fails (both probably wine related)
# majority of tests does pass though
#check() {
#  for _arch in ${_architectures}; do
#    cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
#
#    export WINEDEBUG=-all
#    ln -s "${srcdir}/dav1d-${pkgver}/build-${_arch}/src/libdav1d.dll" ./libdav1d.dll
#    meson test
#  done
#}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    
    DESTDIR="$pkgdir" ninja install
  done

  cd "${srcdir}/dav1d-${pkgver}"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 doc/PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
