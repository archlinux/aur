# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.12.0
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
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
#source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz tuxedo_io.conf dkms.conf)
source=($pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz tuxedo_io.conf dkms.conf)
sha256sums=('5810f549613fcff6ff84718a63198b1ada38a597c40baf01d9bb9158c81489d6'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
            'f49f76d3fe8eed44bdf7ec58b411302e4a15604815fa9d8b67140e9235d288d0')
sha512sums=('8c6a475035375c0838e34c0636f99cc4db2914a21400166f009fbc4c8b78f90c42436f0dac7d7c7d4a04b82c4914c54311a673d24230f2409571747fb7807787'
            '3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81'
            'bebe75bbd3cc2e3b785733bd92ed183f0654e68396bd08e4229231401a90e12d57ef08d7ff3f73acd5337d7a4f272deadab2ed52dcdded6762ce4260840791e8')

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/Makefile -t "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  #cp -avr "${_pkgname%}-$pkgver"/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  cp -ar "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-$pkgver"/99-infinityflex-touchpanel-toggle.rules  -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-$pkgver"/61-sensor-infinityflex.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d"
}
