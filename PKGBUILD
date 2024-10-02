# NUC X15
# Maintainer: nuvole <mitltlatltl@gmail.com>
# Contributor: nuvole <mitltlatltl@gmail.com>

# Original TUXEDO
# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>

_pkgname=tuxedo-drivers
pkgname=kc57-drivers-dkms
pkgver=4.8.0
pkgrel=1
pkgdesc="Intel NUC X15(LAPKC51E, LAPKC71E, LAPKC71F) kernel module drivers for general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
license=('GPL2' 'GPL3')
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')

provides=('tuxedo-drivers-dkms')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms')

source=($_pkgname-$pkgver.tar.gz::https://github.com/tuxedocomputers/tuxedo-drivers/archive/v${pkgver}.tar.gz
        kc57_battery.c::https://raw.githubusercontent.com/right-0903/kc57_battery/tuxedo/battery.c
        kc57_battery.h::https://raw.githubusercontent.com/right-0903/kc57_battery/tuxedo/kc57_battery.h
        tuxedo_io.conf
        dkms.conf
        0001-remove-the-unnecessary-for-NUC-X15.patch)

sha256sums=('2dfbce978fd8f31fc9545bf00de5b6cd2b50a7ec180984e7fa986a7ed90fb3a3'
            'e0cd6dc583fffc92f3a10d51f7cba7bde7e2f5c65d87db630a2f1468175168a0'
            '9ee323b90ec7fc3512dd8db9bf359cb1422c41a9f0f0dd31e8a8ea9714663173'
            '1debb5fe0f454295746712286198399486fd3a08692916bf17846f9d93f4bdbb'
            '3e041d1838dc5fc83ac76c88a246e71e128fb4b3f26f963b46af4ac9f31d7a74'
            'e78fa2a2193fe96ad8b21f2f280978f6592f922528fe9897b01ebe6fb082372b')

prepare() {
  # remove unnecessary modules for NUC X15
  patch -d "${srcdir}/${_pkgname}-${pkgver}/" -p1 -i "${srcdir}/0001-remove-the-unnecessary-for-NUC-X15.patch"

  # place charging limit driver, if you don't need this, comment it.
  cp "${srcdir}/kc57_battery."{c,h} "${srcdir}/${_pkgname}-${pkgver}/src"
  echo 'obj-m += kc57_battery.o' >> "${srcdir}/${_pkgname}-${pkgver}/src/Kbuild"
}

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${pkgname%}-$pkgver/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${pkgname%}-$pkgver/"
}
