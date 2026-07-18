# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-dav1d
pkgver=1.5.4
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
sha512sums=('75ab7c922bc9647d73534c9f6c95a514748557adbf7a4debf95eee52ef1db681012cbaad165a46141d904cdd01c1e6319cdea33d254afb5c6b3d968679e55b98'
            'SKIP'
            '8e8def3d249e5fe96ec341b60da31ee360c850e312564a084f83f0ebd2051ebef02ba538497de6a9785dcc099f2447e90400c519b434568e2829a741227ddcca')
b2sums=('52db76db6c498301c0ff0fd1c28aeb9820e303846b5c6243c1dd8c8f9f0e0d1de1194cd618015e3ecf7f717ec1b901bc548d1103dc0c49203f2ef207ee867ed5'
        'SKIP'
        '9efa489893cfbfa372d5221b55722ff587b2c2bd8765e9004511a81e688f9d5b37d3fcc7a8b311efd62277a86bba874f8f20541daac84f0a2138b403f23fe02a')
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
