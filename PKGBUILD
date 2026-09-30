# Maintainer: amad3v
# Local build from a checkout:  RECOIL16_GIT=file://$PWD/../../.. makepkg -si

pkgname=recoil16-dkms-git
_srcname=recoil16
pkgver=1.4.0.r1.g5354e3a
pkgrel=1
pkgdesc="Drivers for the PCSpecialist Recoil 16 AMD (TUXEDO Stellaris 16 Gen7): keyboard backlight, lightbar, power profiles, charge modes, battery health, Copilot key"
# x86_64: the DKMS sources build against the x86-only ACPI/WMI platform drivers (uniwill-laptop)
arch=('x86_64')
url="https://github.com/amad3v/recoil16"
license=('GPL-2.0-only' 'GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build the modules for the linux kernel'
  'recoil16ctl: the control tool (charge modes, lightbar, status and checks)')
provides=('recoil16-dkms')
conflicts=('recoil16-dkms')
install=recoil16.install
# no binaries in this package
options=('!debug')
source=("$_srcname::git+${RECOIL16_GIT:-https://github.com/amad3v/recoil16.git}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname" || return
  # release tags (v1.0.0) give 1.0.0.r<commits since tag>.g<hash>
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '%s.r%s.g%s' "$(sed -n 's/^PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package() {
  cd "$_srcname" || return
  # shellcheck disable=SC2154 # pkgdir is set by makepkg for package()
  local src="$pkgdir/usr/src/$_srcname-$pkgver"

  install -d "$src"
  cp -r --no-preserve=ownership Kbuild ite8291-mono ite8233-lightbar copilot-rctrl uniwill-laptop-pcs "$src/"
  rm -rf "$src/uniwill-laptop-pcs/patches"
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf >"$src/dkms.conf"

  install -Dm644 man/recoil16.7 -t "$pkgdir/usr/share/man/man7/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
