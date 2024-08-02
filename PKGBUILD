# NUC X15
# Maintainer: nuvole <mitltlatltl@gmail.com>
# Contributor: nuvole <mitltlatltl@gmail.com>

# Original TUXEDO
# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>

_pkgname=tuxedo-drivers
pkgname=kc57-drivers-dkms
pkgver=4.6.1
pkgrel=2
pkgdesc="Intel NUC X15(LAPKC51E, LAPKC71E, LAPKC71F) kernel module drivers for general hardware I/O using the SysFS interface"
url="https://github.com/tuxedocomputers/tuxedo-drivers"
license=("GPL3")
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

sha256sums=('94f3a3a0d491b9f030c93384a7b7f0fc10bba43bcb98f4c084b195500a3728e8'
            'e0cd6dc583fffc92f3a10d51f7cba7bde7e2f5c65d87db630a2f1468175168a0'
            '9ee323b90ec7fc3512dd8db9bf359cb1422c41a9f0f0dd31e8a8ea9714663173'
            'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c'
            '2a98c17d0fc55c9fc104bcb682e0d8d19f2e11fd9f5c0876267444d4d5c78ffe'
            'bc7c7d33ca7c2531ca7d1883abebb818d92d2c83ce515e6a23026b502e447fd8')

prepare() {
  # remove unnecessary modules for NUC X15
  patch -d "${srcdir}/${_pkgname}-${pkgver}/" -p1 -i "${srcdir}/0001-remove-the-unnecessary-for-NUC-X15.patch"

  # place charging limit driver, if you don't need this, comment it.
  cp "${srcdir}/kc57_battery."{c,h} "${srcdir}/${_pkgname}-${pkgver}/src"
  echo 'obj-m += kc57_battery.o' >> "${srcdir}/${_pkgname}-${pkgver}/src/Kbuild"
  echo '' >> "${srcdir}/dkms.conf"
  echo 'DEST_MODULE_LOCATION[4]="/kernel/lib/"' >> "${srcdir}/dkms.conf"
  echo 'BUILT_MODULE_NAME[4]="kc57_battery"' >> "${srcdir}/dkms.conf"
}

package() {
  mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" dkms.conf
  install -Dm644 dkms.conf -t "$pkgdir/usr/src/${pkgname%}-$pkgver/"
  install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
  cp -avr "${_pkgname%}-$pkgver"/src/* "$pkgdir/usr/src/${pkgname%}-$pkgver/"
}
