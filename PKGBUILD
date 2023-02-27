# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays-git
pkgver=0.90.5.r33.g0e128d2
pkgrel=2
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm'
         'protobuf-c' 'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git'
        'https://gitlab.gnome.org/GNOME/gnome-network-displays/-/merge_requests/171.patch')
sha256sums=('SKIP'
            '6b8fa34a2f1a563e8e59514c80622a2b1c32ce7e132b1d8547ccab76baaa4284')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Add Chromecast support
  patch -Np1 -i ../171.patch
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
