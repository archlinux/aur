# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays-git
pkgver=0.92.1.r2.g3453460
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
makedepends=('git' 'meson')
optdepends=('dnsmasq' 'gst-plugin-pipewire' 'gstreamer-vaapi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # https://gitlab.gnome.org/GNOME/gnome-network-displays/-/issues/272
  sed -i -e "s/args: \['validate'/args: \['--nonet', 'validate'/" \
    data/meson.build
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
