# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.14.0
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
sha256sums=('da75ecffebccc5b65cd381e65f22760e95606acff3f1e4b794097154d8391613')
sha512sums=('4de9532c086636eb11df21d4bf54adb4f64358bbcf8de418d77b177f20d5ea9157be3eb4fa99ed97821c5a8604c3ab6bf27d708e3c7105a1e947be0b94d6e313')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  install -Dm644 "${_pkgname%}-v$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  install -Dm644 "${_pkgname%}-v$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  cp -ar "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/99-infinityflex-touchpanel-toggle.rules  -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-sensor-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d"
  install -Dm644 "${_pkgname%}-v$pkgver"/61-keyboard-tuxedo.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"
}
