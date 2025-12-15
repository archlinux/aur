# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays
pkgver=0.98.0
pkgrel=1
pkgdesc="Screencasting for GNOME. Supports the Miracast and Chromecast protocols."
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL-3.0-or-later')
depends=(
  'avahi'
  'dnsmasq'
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gst-rtsp-server'
  'gstreamer'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libnm'
  'libportal'
  'libportal-gtk4'
  'libpulse'
  'libsoup3'
  'networkmanager'
  'protobuf-c'
  'xdg-desktop-portal'
)
makedepends=(
  'glib2-devel'
  'meson'
)
optdepends=('gstreamer-vaapi')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('dc9d48b16404869f7208401c44dadbe273736e7fd79dc2788d11ed0ac9440bd1')

prepare() {
  cd "$pkgname-$pkgver"

  # Remove hardcoded libexec path
  sed -i 's/libexec/lib/g' src/nd-systemd-helpers.c src/meson.build
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
