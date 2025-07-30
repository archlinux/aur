# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.14.4
pkgrel=2
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
sha256sums=('ece23bb7ead1b643886730308b987d97174bc3a48b45ca2fad337bd3b33fec22')
sha512sums=('f4460bfadffd4875822c69cda4c6f6ec00eddb76689cfb12585a3cb99e582b2b4d775f893ce20a7c8abd8e30dcc22d12dafc075a38986b2c26c400b936b657d9')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  install -Dm644 "${_pkgname%}-v$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  install -Dm644 "${_pkgname%}-v$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  cp -ar "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"

  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-infinity-flex-touchpanel-toggle.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-intel-gen13-sleep-state.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-nb02-touchpad-mouse.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-pulse-gen2-wakeup-through-nvme-controller.rules -t "$pkgdir/etc/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-realtek-rts522a-idle-behaviour.rules -t "$pkgdir/etc/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-tuxedo-fix-systemd-led-bootdelay.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-sensor-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-keyboard-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"
}
