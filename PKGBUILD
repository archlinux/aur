# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=gnome-firmware-updater
pkgname=$_pkgname-git
pkgver=3.34.0.r5.gcb2aed8
pkgrel=1
pkgdesc="GNOME application to update, reinstall and downgrade firmware on devices 
supported by fwupd"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/hughsie/gnome-firmware-updater"
license=(GPL2)
depends=(gtk3 fwupd libxmlb libsoup)
makedepends=(git meson appstream help2man)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/hughsie/$_pkgname.git")
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

