# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=mingw-w64-dav1d
pkgver=1.5.3
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
sha512sums=('3d6a1a67a3c7d171747fd244566b23c66c174c4aad1964fef95367b2b33a187abb544e83dccc27d9cda409c8156b7c44a8bf33af810e8fa79d08cb5f3796fa54'
            'SKIP'
            'e6a2e00685e6f1fe78f5f207a6df5a185eaf958064d0da0fbadbea487833c6bfdd89a164aeb8861f93bd7f38e8ef5a740561f32b5ddb488532a33e86efa26da4')
b2sums=('e8eb38c2b4a280f5fdc812e4ce37f0e1a8a24e95a787ac407114681f884fcee0d03800ebb14ee18b0088ef3396fa3be94eff927cc2796fd69fde0732c178750b'
        'SKIP'
        'eaa18260b5c7596c8318b4f7c75ecf0a5c96101990ad4bbad57bb3825a6a9f11c9f3c1eac4e789847daaf09f432df1c5ee6f61189736f574251c462153c9e46d')
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
