# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-dav1d
pkgver=1.5.1
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
sha512sums=('3582dff4f797ebe2c137b28549a7214f11869ae308e3c78440849a3a501b12c326d3fa604126ccff4b648f37ab260c003c63385c70ba91e11f3442f20ad455db'
            'SKIP'
            '37d77cf5d9db2a08f8364b854b7e43277660778411a38ae1d9ea5ba173c47c716f930da774688d2059617e3cf4d19f9a35975c3fdf8a431d32b1aa26a98ce3a2')
b2sums=('482eefcf40aaf780dcb7eb888a83feb946e2ab4249d92b68bc629f2c84e3c9e5170210f367d7b1506449d6f3f7ea176b5f571f584d9557c5af6d11ca643ff378'
        'SKIP'
        '67f7c7dae02edb5d54c1e915da4164cad87135119bfc650268a69dd79be9f73ca4dcf785caa4c92e1f34bd7df04ff1ba8ccd991092d39f369530a85dfee51ee7')
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
