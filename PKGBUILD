# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgbase=pulseeffects-git
pkgname=("${pkgbase}" "gst-plugins-${pkgbase}")
pkgver=4.8.4.r85.gb773fad2
pkgrel=1
pkgdesc='Audio Effects for Pulseaudio Applications'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='https://github.com/wwmm/pulseeffects'
license=('GPL3')
makedepends=('meson' 'boost' 'git' 'itstool' 'appstream-glib'
  'zam-plugins' 'rubberband')
source=("git+https://github.com/wwmm/pulseeffects.git")
conflicts=(pulseeffects)
provides=(pulseeffects)
sha512sums=('SKIP')

pkgver() {
  cd pulseeffects
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p pulseeffects/build
  cd pulseeffects/build

  arch-meson ..

  ninja
}

package_pulseeffects-git() {
  pkgdesc="Audio Effects for Pulseaudio Applications"
  depends=('gtk3' 'gtkmm3' 'glibmm' 'libpulse'
    'gstreamer' 'gst-plugin-gtk' 'gst-plugins-bad' 'gst-plugin-pipewire' 'gst-plugins-pulseeffects'
    'lilv' 'boost-libs' 'libsigc++' 'calf' 'lsp-plugins' 'yelp')
  optdepends=('zam-plugins: maximizer'
    'rubberband: pitch shifting')
  conflicts=(pulseeffects)
  provides=(pulseeffects)

  cd pulseeffects/build

  DESTDIR="${pkgdir}" ninja install
  rm -r "${pkgdir}/usr/lib"
}

package_gst-plugins-pulseeffects-git() {
  pkgdesc="Audio Effects for Pulseaudio Applications - gstreamer plugins"
  depends=('gstreamer' 'gst-plugins-base' 'libebur128' 'librnnoise'
    'libsndfile' 'libsamplerate' 'zita-convolver')
  optdepends=()
  conflicts=(gst-plugins-pulseeffects)
  provides=(gst-plugins-pulseeffects)

  cd pulseeffects/build

  DESTDIR="${pkgdir}" ninja install
  rm -rf "${pkgdir}"/usr/{bin,share}
}
