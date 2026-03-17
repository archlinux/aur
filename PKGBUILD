# Maintainer: Shiina Rikka <rikka@rikka.im>
_pkgname=mechrevo-drivers
pkgname=mechrevo-drivers-dkms
pkgver=4.21.2
pkgrel=1
pkgdesc='Kernel modules for MECHREVO devices. Drivers for several platform devices for MECHREVO notebooks meant for DKMS. Modified from TUXEDO drivers.'
arch=('x86_64')
url='https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers'
license=('GPL-2.0+')
depends=('dkms')
provides=('tuxedo-drivers-dkms'
	          'tuxedo-keyboard'
            'tuxedo-keyboard-ite'
            'tuxedo-io'
            'clevo-wmi'
            'clevo-acpi'
            'uniwill-wmi'
            'ite_8291'
            'ite_8291_lb'
            'ite_8297'
            'ite_829x')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v$pkgver/tuxedo-drivers-v$pkgver.tar.gz dkms.conf patch.diff )
sha256sums=('d76d0da7562cc027b7d5dbf482047931094dd991165ceea3b0e8935f7ded2c14'
            'd955ba6609666364eb63b073fd7bd9f5397de523e39226eb1b1fe866b4567a4e'
            '4a4c42bcc83bcd24deaa872faf63475faf6e49ee14d0ea20a0d1fe3c4d3901e9')

prepare(){
  cd "${srcdir}/tuxedo-drivers-v$pkgver"
	patch -Np1 -i ../patch.diff
}

package() {
  install -Dm644 "$srcdir"/dkms.conf "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"
  sed -i "s/#MODULE_VERSION#/$pkgver/g" "$pkgdir/usr/src/${pkgname%-dkms}-$pkgver/dkms.conf"

  install -Dm644 "tuxedo-drivers-v$pkgver"/files/usr/lib/modprobe.d/*.conf -t "$pkgdir/usr/lib/modprobe.d/"
  install -Dm644 "tuxedo-drivers-v$pkgver"/files/usr/lib/udev/rules.d/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 "tuxedo-drivers-v$pkgver"/files/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d/"

  mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -ar "tuxedo-drivers-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-$pkgver/"
}
