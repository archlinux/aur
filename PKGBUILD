# Maintainer: Jonpas <jonpas33@gmail.com>
# Contributor: forivall <forivall@gmail.com>

_pkgbase=hid-lg-g710-plus
_pkgname=${_pkgbase}-dkms
pkgname=${_pkgname}-git
pkgdesc="Linux DKMS kernel module allowing use of extra keys and LEDs on the Logitech G710+"
pkgver=r35.ba8c9f6
pkgrel=6
arch=('x86_64')
license=('GPL2')
url="https://github.com/jonpas/logitech-g710-linux-driver"
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel')
makedepends=('git')
provides=('hid-lg-g710-plus')
conflicts=('hid-lg-g710-plus' 'logitech-g710-kmod-git' 'logitech-g710')

source=("${_pkgbase}::git://github.com/jonpas/logitech-g710-linux-driver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  local rev="$(git rev-parse --short HEAD)"

  msg2 "Copying sources, including dkms.conf..."
  mkdir -p "${pkgdir}/usr/src/"
  cp -r src/kernel "${pkgdir}/usr/src/${_pkgbase}-$pkgver/"

  msg2 "Copying udev rules..."
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  cp misc/90-logitech-g710-plus.rules "$pkgdir/etc/udev/rules.d/"

  msg2 "Copying .Xmodmap..."
  mkdir -p "${pkgdir}/usr/share/logitech-g710/"
  cp misc/.Xmodmap "${pkgdir}/usr/share/logitech-g710/"
}
