# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays-git
pkgver=0.90.5.r40.gebd012f
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly'
         'gst-rtsp-server' 'libpulse' 'networkmanager' 'protobuf-c'
         'python-gobject' 'xdg-desktop-portal')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=('dnsmasq' 'gst-plugin-pipewire' 'gstreamer-vaapi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

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
