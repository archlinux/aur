# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=freedv-gui
pkgver=2.0.2
pkgrel=2
pkgdesc="Digital Voice for Radio Amateurs"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url="https://freedv.org/"
depends=('libpulse' 'hamlib' 'sox' 'wxwidgets-gtk3' 'codec2' 'speex' 'libao' 'libsamplerate' 'gsm' 'libsndfile' 'python-pytorch' 'python-torchaudio' 'python-matplotlib')
makedepends=('cmake')
source=(
  "codec2_gp_interleaver.h.patch"
  "disable_mimalloc.patch"
  "freedv.sh"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  )
sha512sums=('89aebd2ddec75e7770cd4f6224b6cdfe59de8175480040d55ee56201ecb77f5e087743a018b9a4b18cda0f19a8eebe13816d83609e1a703b461900a1dc6ceeff'
            'd6c0792740cbba5cf687c6b75f8150d27f02626cfe6404ad5e5b653817108313386a85936cc3c47608fec726d197b9c03a4b204f2551c7a9053562ec65f3357f'
            '7d505ff36176baeca347c52a5c7bdb819bea9cd059783588e3438a02a9f707d66cf2201ce7ff202cee660936ff33adcfda4b1a707013b14fcb25b82c3007531a'
            '32cb1719d87b1693a4760202a548d44da5213c09c2d3b432034e5ea0ae40a4eef8c5834467bb071764f1135bfc2022da7d2e1eb7448c003d761f440c2471999c')

prepare() {
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/codec2_gp_interleaver.h.patch"
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/disable_mimalloc.patch"
}

build() {
  # at the moment the installer downloads opus ;-(
  cmake -B build -S "$pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_STATIC_DEPS=FALSE \
    -DUSE_NATIVE_AUDIO=TRUE
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -m0755 -D "build/rade_build/src/radae_rx" "$pkgdir/usr/bin/radae_rx"
  install -m0755 -D "build/rade_build/src/radae_tx" "$pkgdir/usr/bin/radae_tx"
  install -m0755 -D "build/rade_build/src/lpcnet_demo" "$pkgdir/usr/bin/lpcnet_demo"
  install -m0755 -D "build/rade_build/src/test_rade_dec" "$pkgdir/usr/bin/test_rade_dec"
  install -m0755 -D "build/rade_build/src/test_rade_enc" "$pkgdir/usr/bin/test_rade_enc"
  install -m0755 -D "build/rade_build/src/write_rade_weights" "$pkgdir/usr/bin/write_rade_weights"
  install -m0755 -D "build/rade_build/src/librade.so" "$pkgdir/usr/lib/librade.so"
  install -m0755 -D "build/rade_build/src/librade.so.0.1" "$pkgdir/usr/lib/librade.so.0.1"
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
