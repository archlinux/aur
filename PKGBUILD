# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays
pkgver=0.92.1
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL-3.0-or-later')
depends=(
  'avahi'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gst-rtsp-server'
  'libadwaita'
  'libportal-gtk4'
  'libpulse'
  'networkmanager'
  'protobuf-c'
  'python-gobject'
  'xdg-desktop-portal'
)
makedepends=('meson')
optdepends=('dnsmasq' 'gst-plugin-pipewire' 'gstreamer-vaapi')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7b7949880d61e384ce4ec1deceedf94903298a462a7275cb1e894c370dc52241')

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
