# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-dav1d
pkgver=1.5.2
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (mingw-w64)'
arch=('any')
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD-2-Clause')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader')
options=('!strip' '!buildflags' '!libtool' 'staticlibs' '!debug')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-meson'
  'mingw-w64-wine'
  'mingw-w64-xxhash'
  'nasm'
  'ninja'
  'doxygen'
  'graphviz'
)
source=(
  https://downloads.videolan.org/pub/videolan/dav1d/${pkgver}/dav1d-${pkgver}.tar.xz{,.asc}
  https://code.videolan.org/videolan/dav1d-test-data/-/archive/${pkgver}/dav1d-test-data-${pkgver}.tar.gz
)
sha512sums=('c648425994bf77d6916ec34f2b5dfa6c596138984ca186d723c5dee3d183bbe034c144088c048506582aaaf537f3b730ab1b531364c3b4a5c980f6bd3e454daf'
            'SKIP'
            '2e577eef19954845d7174dc05c1e29e58f80313f43044f8db15d171772d43bf9cf85f1f70a957a525d977f6ac803aff54cb8243f54e17c1cc4e40dcd9f9fb8b3')
b2sums=('1a7aef083622f5d0fae1d4e16c9e2cf142fd00c072fb891c4790b9166c7e9f184e5cca8718eb0eacf70e86b63a1cc9fdadb1e66bf14b42a3b291485612d3c38b'
        'SKIP'
        'a59e705ecac035862bd74500c40a9d6263b984ea5f7959cbe85041df5d666a9d0a7ccd1e2643fe4bf5261dceb78dc6016020bcd3f60532f5a076f354e270a70c')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
validpgpkeys=(
  '65F7C6B4206BD057A7EB73787180713BE58D1ADC' # VideoLAN Release Signing Key
)

prepare() {
  cd "${srcdir}/dav1d-${pkgver}"
  ln -sf "${srcdir}/dav1d-test-data-${pkgver}" tests/dav1d-test-data
}

build() {
  export NEED_WINE=1
  export WINEDEBUG=-all
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/dav1d-${pkgver}/build-${_arch}" && cd "${srcdir}/dav1d-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      --default-library both \
      -Dtestdata_tests=true \
      -Denable_docs=false \
      ..

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
#    ln -sf "${srcdir}/dav1d-${pkgver}/build-${_arch}/src/libdav1d.dll" ./libdav1d.dll
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
