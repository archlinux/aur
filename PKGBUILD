# Maintainer: amad3v

pkgname=recoil16-dkms
_srcname=recoil16
pkgver=1.4.0
pkgrel=1
pkgdesc="Drivers for the PCSpecialist Recoil 16 AMD (TUXEDO Stellaris 16 Gen7): keyboard backlight, lightbar, power profiles, charge modes, battery health, Copilot key"
# x86_64: the DKMS sources build against the x86-only ACPI/WMI platform drivers (uniwill-laptop)
arch=('x86_64')
url="https://github.com/amad3v/recoil16"
license=('GPL-2.0-only' 'GPL-2.0-or-later')
depends=('dkms')
optdepends=('linux-headers: build the modules for the linux kernel'
  'recoil16ctl: the control tool (charge modes, lightbar, status and checks)')
conflicts=('recoil16-dkms-git')
install=recoil16.install
# no binaries in this package
options=('!debug')
source=("$_srcname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baeec25271e3dc576b42ce4d7d91f299f9115b3c4a3a40d60d077c1a5a3d1c3c')

package() {
  cd "$_srcname-$pkgver" || return
  # shellcheck disable=SC2154 # pkgdir is set by makepkg for package()
  local src="$pkgdir/usr/src/$_srcname-$pkgver"

  install -d "$src"
  cp -r --no-preserve=ownership Kbuild ite8291-mono ite8233-lightbar copilot-rctrl uniwill-laptop-pcs "$src/"
  rm -rf "$src/uniwill-laptop-pcs/patches"
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf >"$src/dkms.conf"

  install -Dm644 man/recoil16.7 -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
