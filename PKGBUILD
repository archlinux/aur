# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.21.2
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
            'linux-hardened-headers: build modules against the HARDENED kernel'
            'udev-hid-bpf: resolve keyboard issues on the Sirius 16 Gen1/2')
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
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz dkms.conf)
sha256sums=('d76d0da7562cc027b7d5dbf482047931094dd991165ceea3b0e8935f7ded2c14'
            '0b1f2ceb729b1944504d1227e39b202159076846aaa38f8b6237b9535e543a21')
sha512sums=('d44f713978f6e1013a8ec395f792a6c060a08c6692ae0c99f7ad4f4135b4949a134208a615f67874de4348e47b10aad18e761cecce1848a26165f196579ae4ce'
            'dda443b5966221a355fecdae7a2eb23346666cbcf93707d2fff660a32ec75cee592ae211c8d22e55413d530f59e8667292a0346d8bf6b2d280b45f3bc09efafd')

package() {

  install -Dm644 "$srcdir"/dkms.conf "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/$pkgver/g" "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"

  install -Dm644 "${_pkgname%}-v$pkgver"/files/usr/lib/modprobe.d/*.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/files/usr/lib/udev/rules.d/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "${_pkgname%}-v$pkgver"/files/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

  mkdir -p "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/"
  cp -r "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/"

}
