# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >

pkgname=mingw-w64-dav1d
pkgver=1.1.0
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (mingw-w64)'
arch=('any')
url='https://code.videolan.org/videolan/dav1d/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-vulkan-icd-loader')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'mingw-w64-xxhash' 'nasm' 'ninja' 'doxygen' 'graphviz')
source=(https://downloads.videolan.org/pub/videolan/dav1d/${pkgver}/dav1d-${pkgver}.tar.xz{,.asc}
        https://code.videolan.org/videolan/dav1d-test-data/-/archive/${pkgver}/dav1d-test-data-${pkgver}.tar.gz)
sha512sums=('b040688722a3fc7adc1fff77410c40239f6de9ccb4ea39f7c63ab04362dfd9759f98c4e2d5de0fb9e9d65208cd439d5d7eaa8c0982f773e110451a7ab9ed213f'
            'SKIP'
            'e14a143a0d36c33d7985589367d7b7b5e7e733f23dac1fe83ae123e0cffe29f16e6f567046fe28e6b374c8370d1775a715919e2a43361f46d7baf117b5ffebdb')
b2sums=('80b3921c66af2f8d4d2aeb5b0a7df43baa8c1b461d5f3395e77c3abe4a99606d2e034d4afc13b72705f61dea4eece1291c54a82d7020e9a52a45bdeb4cf1e405'
        'SKIP'
        '17dada333f90065ef115c9ba2e47db39f03eb5b3de626c92bb77e0085d6574ff8ee5b31765e877c450c7f4ddda8454a4f2637d1667c62f884525ed5acb4a6423')
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
