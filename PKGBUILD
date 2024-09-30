# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

_pkgname=pulseeffects-legacy
pkgname="${_pkgname}-fixed"
pkgver=4.8.7
pkgrel=2
pkgdesc="Audio Effects for Pulseaudio Applications, without pipewire"
arch=($CARCH)
url='https://github.com/wwmm/pulseeffects'
license=(GPL3)
depends=(boost-libs glibmm gst-plugin-gtk gst-plugins-bad gstreamer gtk3 gtkmm3 libebur128 libpulse libsamplerate libsigc++ libsndfile lilv zita-convolver)
makedepends=(appstream-glib boost calf itstool meson rnnoise rubberband zam-plugins)
optdepends=('calf: bass enhancer, deesser, exciter, filter, gates, limiter, multiband compressor, reverb, stereo tools'
            'lsp-plugins: equalizer, delay'
            'rnnoise: noise reduction'
            'rubberband: pitch'
            'zam-plugins: maximizer'
            'yelp: help documentation')
conflicts=(${_pkgname%-*})
provides=(${_pkgname%-*})
source=("$url/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/wwmm/pulseeffects/7c570c6e1354adedf01f7ba1e8fbe063cfc15ff2/data/pulseeffects.svg"
        "boost-version.patch")
sha256sums=('d841f27df87b99747349be6b8de62d131422369908fcb57a81f39590437a8099'
            'f9167f96246879eecd907a504b0a70050dc4d90fa520c556c813336974754350'
            '771d44cd0e84e9d58f361c2245da04a5eccf6b087df9ded32907647d473316cb')

prepare() {
  ## Fix SVG rendering issue in Qt environments (https://github.com/wwmm/pulseeffects/issues/867)
  if [[ -e /usr/bin/qmake ]]; then
    cp -L pulseeffects.svg easyeffects-$pkgver/data/
  fi
  cd "easyeffects-$pkgver/"
  patch -p1 --verbose < "${srcdir}/../boost-version.patch"
}

build() {
  arch-meson easyeffects-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
