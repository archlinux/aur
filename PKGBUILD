# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

pkgname=rakarrack-plus
pkgver=1.2.3
pkgrel=1
pkgdesc='Guitar Effects Processor'
arch=(x86_64 aarch64)
url='https://github.com/Stazed/rakarrack-plus'
license=(GPL2)
depends=(alsa-utils gcc-libs libxpm)
makedepends=(cmake fftw fltk jack liblo lv2 libsndfile python)
checkdepends=(lilv lv2lint)
optdepends=('lv2-host: for running LV2 plugins'
            'new-session-manager: for NSM support')
groups=(lv2-plugins pro-audio)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stazed/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba859df9897005e580a79cfa387a40848ab52d16960adb6a1172b183c091d1f7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DEnableSysex=ON -DBuildCarlaPresets=ON \
    -Wno-dev
  cmake --build build
}

check() {
  mkdir -p "$srcdir"/test
  DESTDIR="$srcdir"/test make -C build/lv2 install
  local _lv2path="$srcdir"/test/usr/lib/lv2
  local _plugins=($(LV2_PATH="$_lv2path" lv2ls))
  LV2_PATH="$_lv2path":/usr/lib/lv2 lv2lint -Mpack -d -q \
    -t "Plugin Symbols" \
    ${_plugins[@]}
  rm -rf "$srcdir"/test
}

package() {
  depends+=(libasound.so libfftw3.so libfftw3f.so libfltk.so libfltk_images.so libjack.so liblo.so
    libsamplerate.so libsndfile.so)
  DESTDIR="$pkgdir" cmake --install build
}
