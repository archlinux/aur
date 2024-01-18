# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays
pkgver=0.91.0
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL-3.0-or-later')
depends=(
  'avahi'
  'gtk3'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gst-rtsp-server'
  'libpulse'
  'networkmanager'
  'protobuf-c'
  'python-gobject'
  'xdg-desktop-portal'
)
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('dnsmasq' 'gst-plugin-pipewire' 'gstreamer-vaapi')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e88e03180148641ca354413cbff0117702df87dc7ca88d0fa30d08b73910b4fb')

prepare() {
  cd "$pkgname-$pkgver"

  # https://gitlab.gnome.org/GNOME/gnome-network-displays/-/issues/272
  sed -i -e "s/args: \['validate'/args: \['--nonet', 'validate'/" \
    data/meson.build
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
