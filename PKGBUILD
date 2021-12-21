# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=gnome-firmware
pkgname=$_pkgname-git
pkgver=3.36.0.r40.g96cc9e4
pkgrel=1
pkgdesc="GNOME application to update, reinstall and downgrade firmware on devices 
supported by fwupd"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/hughsie/gnome-firmware-updater"
license=(GPL2)
depends=(fwupd gcab glib2 gtk3 libhandy libjcat libsoup libxmlb systemd)
makedepends=(git meson help2man)
provides=("$_pkgname" "gnome-firmware-updater")
replaces=("gnome-firmware-updater-git")
conflicts=("$_pkgname" "gnome-firmware-updater")
source=("$_pkgname::git+https://gitlab.gnome.org/hughsie/gnome-firmware-updater.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

