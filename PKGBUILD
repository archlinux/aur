# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.14.4
pkgrel=4
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
sha256sums=('d3dcdd3a07b90a592095cda06112ec01cd85cb0b65332bcb96a591254c995c67')
sha512sums=('28f15fe984b205b0bc32935a0bb935467d31dea9617deada26c878df178f7cc3a8d1217c6d8e00629a4febc25966f0a315e890c6933d44168872d53c5181ae25')

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
