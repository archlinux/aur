# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays-git
pkgver=0.90.5.r33.g0e128d2
pkgrel=5
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-good' 'gst-plugins-ugly' 'gst-rtsp-server'
         'libpulse' 'libnm' 'protobuf-c' 'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
optdepends=('dnsmasq' 'gst-plugin-pipewire')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git'
        'https://gitlab.gnome.org/GNOME/gnome-network-displays/-/merge_requests/171.patch')
sha256sums=('SKIP'
            'b0be3b267e370cc23202febf16c742257f28b173583be795ce5adf113a44a060')

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
