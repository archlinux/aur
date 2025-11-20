# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=2.1.0
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL-2.1-or-later')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'wxwidgets-gtk3' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'python-pytorch' 'python-torchaudio' 'python-matplotlib' 'python-tqdm' 'libebur128')
makedepends=('cmake' 'patchelf')
source=(
  "freedv.sh"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  )
sha512sums=('7d505ff36176baeca347c52a5c7bdb819bea9cd059783588e3438a02a9f707d66cf2201ce7ff202cee660936ff33adcfda4b1a707013b14fcb25b82c3007531a'
            'e30d365ae89920de75ec42b693ed878fff92d624274fdadc00fb693a29b39f32aa83853475582c67ee484684b9bf851b9e0d4ae92853750fc1dd14cb6e0e5dd2')

## trying to use local library
# Codec2:  fatal error: codec2_alloc.h: No such file or directory
# Opus: in Radae, cmake patch dnn/nnet.h < ${CMAKE_SOURCE_DIR}/src/opus-nnet.h.diff
#   then download https://github.com/xiph/opus/blob/f383ea8212f7f78d8c143b37a465897db72c3e26/dnn/download_model.sh
#   cmake patch for opus but then they use a shell script to download opus_data
# radae: who know?!
# mimalloc: requires cmake patch
# ebur128: from system

radae_bins=(
  "radae_rx"
  "radae_tx"
  "lpcnet_demo"
  "test_rade_dec"
  "test_rade_enc"
  "write_rade_weights"
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

  # TODO: radae contains build folder in the header. need removing

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

  # not nice but this avoid to patch the code; copy as is without cleanup
  # at the moment we don't create __pycache__
  # in this way we don't have any issues with new python versions
  install -m0755 -d "${pkgdir}/opt/freedv-gui"
  # preserve=mode,timestamp
  cp -dr --preserve=timestamp "build/rade_src" "${pkgdir}/opt/freedv-gui/rade"
  rm -rf "${pkgdir}/opt/freedv-gui/rade/.git"
  rm -rf "${pkgdir}/opt/freedv-gui/rade/.github"

  # we need to change PYTHONPATH to use rade
  mv "${pkgdir}/usr/bin/freedv" "${pkgdir}/usr/bin/freedv_gui"
  install -m0755 "${srcdir}/freedv.sh" "${pkgdir}/usr/bin/freedv"
}
