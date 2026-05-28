# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=2.3.1
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL-2.1-or-later')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'wxwidgets-gtk3' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'libebur128')
makedepends=('cmake' 'patchelf' 'wget')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=('d9ca7aac3bd4be2692d36f60d2bda5766c032f904edfe983a76b830ddb6981e3a71429cab5413eec17f79bb8371bdef074c0a55bf9b3271335a21fe315fc9e0f')

## trying to use local library
# Codec2:  fatal error: codec2_alloc.h: No such file or directory
# Opus: in Radae, cmake patch dnn/nnet.h < ${CMAKE_SOURCE_DIR}/src/opus-nnet.h.diff
#   then download https://github.com/xiph/opus/blob/f383ea8212f7f78d8c143b37a465897db72c3e26/dnn/download_model.sh
#   cmake patch for opus but then they use a shell script to download opus_data
# radae: who know?!
# mimalloc: requires cmake patch
# ebur128: from system
# rnnoise

radae_bins=(
  "radae_rx"
  "radae_tx"
  "lpcnet_demo"
)
radae_libs=(
  "librade.so.0.1"
)

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_STATIC_DEPS=FALSE \
    -DUSE_NATIVE_AUDIO=TRUE \
    -DUSE_STATIC_EBUR128=FALSE

  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  # remove local RPATH and copy the file in pkgdir
  for file in "${radae_bins[@]}"; do
    patchelf --remove-rpath "build/rade_build/src/$file"
    # can't pass -Wl,--strip-debug via CMAKE_C_FLAGS
    #strip --remove-section=.debug_info "build/rade_build/src/$file"
    install -m0755 -D "build/rade_build/src/${file}" "$pkgdir/usr/bin/${file}"
  done
  for file in "${radae_libs[@]}"; do
    patchelf --remove-rpath "build/rade_build/src/$file"
    #strip --remove-section=.debug_info "build/rade_build/src/$file"
    install -m0755 -D "build/rade_build/src/${file}" "$pkgdir/usr/lib/${file}"
  done
  ln -s "/usr/lib/${radae_libs[0]}" "$pkgdir/usr/lib/librade.so"

  install -m0644 -D "$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
