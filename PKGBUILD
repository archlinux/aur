# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.14.3
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
conflicts=('tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
#source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz)
sha256sums=('fe451a9dc7bdb406ca10129220ee72cfc3567c68a89622922d358dce056924ba')
sha512sums=('0811b61781f607b5ce08b1d584378c14e1d76cc0d7f6e32b83c3c84964b9335d6b46fed8e93d4609ff7e2f7b351fad42d9f4d1aed22ae80c1c52a679ae796787')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  install -Dm644 "${_pkgname%}-v$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  install -Dm644 "${_pkgname%}-v$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  cp -ar "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"

  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-infinity-flex-touchpanel-toggle.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-nb02-touchpad-mouse.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-systemd-led-bootdelay.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-sensor-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-keyboard-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"
}
