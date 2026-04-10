# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-dkms
pkgver=4.22.1
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
sha256sums=('9e2161f128d5d7235a0d51bdf2121a1fb0a9ded8bc2ca48dcf6521986736f571'
            '0b1f2ceb729b1944504d1227e39b202159076846aaa38f8b6237b9535e543a21')
sha512sums=('d53655ed0f8bf051524ce0db89ac2c7fab4355c23638a4d5d7ec954434df2dada804c7489f3728fa553a06f30eec798683bddbb214e5b34bfb18ff50c1d50bdd'
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
