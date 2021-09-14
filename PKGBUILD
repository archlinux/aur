# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

# This is the last release supporting Pulseaudio. The following EasyEffects
# releases will be based on the new Pipewire multimedia server and only fixes
# to critical bugs will be backported to the legacy pulseaudio branch

pkgname=('pulseeffects-legacy-git' 'gst-plugins-pulseeffects-legacy-git')
pkgbase=pulseeffects-legacy-git
pkgver=4.8.5.r1.g4ec1f83b
pkgrel=2
pkgdesc='Audio Effects for Pulseaudio applications'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/wwmm/easyeffects"
license=('GPL3')
depends=('gtk3' 'gtkmm3' 'glibmm' 'pulseaudio' 'gstreamer' 'gst-plugin-gtk'
         'gst-plugins-bad' 'lilv' 'boost-libs' 'libsigc++' 'libsndfile'
         'libsamplerate' 'zita-convolver' 'libebur128')
makedepends=('git' 'meson' 'boost' 'itstool' 'zam-plugins'
             'rubberband' 'rnnoise')
checkdepends=('appstream-glib')
source=('git+https://github.com/wwmm/easyeffects.git#branch=pulseaudio-legacy')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/easyeffects"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  arch-meson easyeffects build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_pulseeffects-legacy-git() {
  depends=('gtk3' 'gtkmm3' 'glibmm' 'pulseaudio' 'gstreamer' 'gst-plugin-gtk'
             'gst-plugins-bad' 'lilv' 'boost-libs' 'libsigc++'
             'gst-plugins-pulseeffects-legacy')
  optdepends=('calf: limiter, compressor exciter, bass enhancer and others'
              'lsp-plugins: equalizer, delay'
              'rubberband: pitch shifting'
              'zam-plugins: maximizer'
              'yelp: in-app help')
  provides=("${pkgname%-git}" 'pulseeffects')
  conflicts=("${pkgname%-git}" 'pulseeffects')

  DESTDIR="$pkgdir" meson install -C build
  mv "$pkgdir/usr/lib" .
}

package_gst-plugins-pulseeffects-legacy-git() {
  pkgdesc+=" - gstreamer plugins"
  depends=('gst-plugins-base' 'gstreamer' 'libebur128' 'rnnoise'
           'libsamplerate' 'libsndfile' 'zita-convolver')
  provides=("${pkgname%-git}"
            'gst-plugins-pulseeffects'
            'libgstpernnoise.so'
            'libgstpecrystalizer.so'
            'libgstpecrystalizer.so'
            'libgstpeconvolver.so'
            'libgstpeautogain.so'
            'libgstpeadapter.so')
  conflicts=("${pkgname%-git}" 'gst-plugins-pulseeffects')

  install -d "$pkgdir/usr"
  mv lib "$pkgdir/usr"
}
