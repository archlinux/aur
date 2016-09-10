# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ring-gnome
pkgver=1.0.0.r66.g398a489
pkgrel=1
epoch=1
pkgdesc="The GNOME client for ring.cx (formerly known as SFLphone)"
arch=("i686" "x86_64")
url="http://ring.cx"
license=('GPL3')
groups=("ring")
depends=("libringclient" "ring-daemon"
         "gtk3" "dconf" "clutter" "clutter-gtk" "qrencode"
         "qt5-base" "gtk-update-icon-cache" "desktop-file-utils"
         "evolution-data-server" "libnotify")
makedepends=('git' 'cmake')
optdepends=('libnm-glib: to make Network Manager notify the daemon when network changes')
source=("git+https://gerrit-ring.savoirfairelinux.com/ring-client-gnome#commit=398a489950970f8bb4cb65f142e8cb155cf60404")
sha256sums=('SKIP')

pkgver() {
  cd "ring-client-gnome"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ring-client-gnome"

  msg2 'Building...'
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_APPINDICATOR=off
  make
}

package() {
  cd "ring-client-gnome/build"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
