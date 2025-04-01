# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-xmg-dkms-git
pkgver=4.12.2
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
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz
  tuxedo_compatibility_check.patch
  tuxedo_io.patch
)
sha256sums=(
  '19171ee42d2c3d1773941f948ac7f8b74a76c902cd482ad5aa9106c17b6e6486'
  'ef88dad138adedf52e6ec0cc406084194da2bb43b33e9abc96c3edb7738ac602'
  'dec506a44a5f34fdab2f1d7222fc97210234be6fd034ca6532fa8f0f1ce84d14'
)
sha512sums=(
  '39e08f2929c4bfaeb29faac35d6d177b58629a7fd2f92c3ee6f5872d49d530584752221e8ae3b3102f95fd16300b74ac721badf407895ec0738b6a4a0c6e4967'
  'SKIP'
  'SKIP'
)

prepare() {
  patch -Np0 -i "${srcdir}"/tuxedo_compatibility_check.patch
  patch -Np0 -i "${srcdir}"/tuxedo_io.patch
}

package() {
  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/etc/udev/rules.d/"
  mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
  install -Dm644 "${_pkgname%}-$pkgver"/debian/tuxedo-drivers.dkms "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" "${pkgdir}/usr/src/${_pkgname%}-$pkgver/dkms.conf"
  install -Dm644 "${_pkgname%}-$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
  cp -ar "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
  install -Dm644 "${_pkgname%}-$pkgver"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-$pkgver"/99-infinityflex-touchpanel-toggle.rules  -t "$pkgdir/etc/udev/rules.d/"
  install -Dm644 "${_pkgname%}-$pkgver"/61-sensor-infinityflex.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d"
}
