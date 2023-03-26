# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays
pkgver=0.90.5
pkgrel=7
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly'
         'gst-rtsp-server' 'libpulse' 'networkmanager' 'python-gobject'
         'xdg-desktop-portal')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('dnsmasq' 'gst-plugin-pipewire' 'gstreamer-vaapi')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1a36cb33735fc8ec50ebdb4b31a507ad870dc2ff4905be5170128f17a9f74172')

prepare() {
  cd "$pkgname-v$pkgver"

  # https://gitlab.gnome.org/GNOME/gnome-network-displays/-/issues/272
  sed -i -e "s/args: \['validate'/args: \['--nonet', 'validate'/" \
    data/meson.build
}

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
