# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays-git
pkgver=0.98.0.r0.g38f830a
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
  'git'
  'glib2-devel'
  'meson'
)
optdepends=('gstreamer-vaapi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Remove hardcoded libexec path
  sed -i 's/libexec/lib/g' src/nd-systemd-helpers.c src/meson.build
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
