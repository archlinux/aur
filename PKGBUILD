# Maintainer: robertfoster
# Contributor: Bleuzen <supgesu@gmail.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Wellington <wellingtonwallace@gmail.com>

pkgbase=pulseeffects-git
pkgname=("${pkgbase}" "gst-plugins-${pkgbase}")
pkgver=5.0.0.r2.g441ea8a0
pkgrel=1
pkgdesc='Audio Effects for Pipewire applications'
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
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  mkdir -p pulseeffects/build
  cd pulseeffects/build

  arch-meson ..

  ninja
}

package_pulseeffects-git() {
  pkgdesc="Audio Effects for Pulseaudio Applications"
  depends=('boost-libs' 'calf' 'glibmm' 'gst-plugin-gtk' 'gst-plugin-pipewire'
    'gst-plugins-bad' 'gst-plugins-pulseeffects' 'gstreamer' 'gtk3' 'gtkmm3'
    'libsigc++' 'lilv' 'lsp-plugins' 'pipewire-pulse' 'yelp')
  optdepends=('rubberband: pitch shifting'
    'zam-plugins: maximizer')
  conflicts=(pulseeffects)
  provides=(pulseeffects)

  cd pulseeffects/build

  DESTDIR="${pkgdir}" ninja install
  rm -r "${pkgdir}/usr/lib"
}

package_gst-plugins-pulseeffects-git() {
  pkgdesc="Audio Effects for Pulseaudio Applications - gstreamer plugins"
  depends=('gst-plugins-base' 'gstreamer' 'libebur128' 'librnnoise'
    'libsamplerate' 'libsndfile' 'zita-convolver')
  conflicts=(gst-plugins-pulseeffects)
  provides=(gst-plugins-pulseeffects)

  cd pulseeffects/build

  DESTDIR="${pkgdir}" ninja install
  rm -rf "${pkgdir}"/usr/{bin,share}
}
