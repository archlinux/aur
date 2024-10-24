# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.10.0
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
license=("GPL3")
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
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz tuxedo_io.conf dkms.conf)
sha256sums=('73a7ca875f97ca27e6493eede304ec1c41027aee8fd81f9356bcafda1a3fe99e'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
            '903775a0397bea91a41121d4071fd4db83ddfc46f32987fd07c4a57104a80af4')
sha512sums=('73deb41abbcd8f2d1546fc01711869ba12f53091a0c4a1a5ad90a4263bae584eb20ce7a08f0e4ab4e845c5326c20c5335950d634b67b69eacc3afeb0ea85cc59'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81'
            'e45d158ecdea914890cb43d68ca038559e07a013712446e25c0cc0e73b00874ba245a2c06d51b66522d8b7c92a0b763d553903b88c666000d64dea9c5d69c532')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/Makefile -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  #cp -avr "${_pkgname%}-$pkgver"/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
}
