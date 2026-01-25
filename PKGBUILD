# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rakarrack-plus
pkgver=1.4.0
pkgrel=1
pkgdesc='Guitar Effects Processor'
arch=(x86_64 aarch64)
url='https://github.com/Stazed/rakarrack-plus'
license=(GPL-2.0-only)
depends=(alsa-utils fltk glibc gcc-libs hicolor-icon-theme libxpm)
makedepends=(alsa-lib cmake jack liblo lv2 libsndfile python zita-resampler)
checkdepends=(lilv lv2lint)
optdepends=('lv2-host: for running LV2 plugins'
            'new-session-manager: for NSM support')
groups=(lv2-plugins pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stazed/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a1b017988609df420ae97a1c1f3682d7058cf8638058edeea09931b7f2514466')

build() {
  cmake -B build-$pkgname-$pkgver -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBuildCarlaPresets=OFF \
    -DBuildRakarrackPlusLV2=OFF \
    -DEnableNTK=OFF \
    -DEnablePFFFT=ON \
    -DEnableSysex=ON \
    -DEnableZITA=ON \
    -Wno-dev
  cmake --build build-$pkgname-$pkgver
}

check() {
  # run unit tests
  local testdir="$srcdir"/test
  mkdir -p "$testdir"
  DESTDIR="$srcdir"/test cmake --install build-$pkgname-$pkgver

  # check LV2 plugins
  local lv2path="$testdir"/usr/lib/lv2
  local plugins=($(LV2_PATH="$lv2path" lv2ls))
  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker kx-programs kx-properties)

  for spec in ${lv2specs[@]}; do
    ln -vsf /usr/lib/lv2/$spec.lv2 "$lv2path"
  done

  LV2_PATH="$lv2path" lv2lint -Mpack -d -q \
    ${plugins[@]}
  rm -rf "$testdir"
}

package() {
  depends+=(libasound.so libfltk.so libjack.so libjpeg.so liblo.so libpng16.so
    libsndfile.so libz.so libzita-resampler.so)
  DESTDIR="$pkgdir" cmake --install build-$pkgname-$pkgver
}
