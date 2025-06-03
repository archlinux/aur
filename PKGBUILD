# NUC X15
# Maintainer: nuvole <mitltlatltl@gmail.com>
# Contributor: nuvole <mitltlatltl@gmail.com>
# Contributor: Artyom Gavrilov <artyom.e.gavrilov@gmail.com>

# Original TUXEDO
# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>

_pkgname=tuxedo-drivers
pkgname=kc57-drivers-dkms
pkgver=$(curl https://raw.githubusercontent.com/tuxedocomputers/tuxedo-drivers/refs/heads/main/debian/changelog | sed -n 's/.*tuxedo-drivers (\([0-9]\+\.[0-9]\+\.[0-9]\+\)).*/\1/p' | head -n1 )
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
        0001-add-initial-support-for-NUC-X15.patch
        0002-add-micmute-F5-support.patch)

sha256sums=('SKIP'
            'SKIP'
            '9ee323b90ec7fc3512dd8db9bf359cb1422c41a9f0f0dd31e8a8ea9714663173'
            '1debb5fe0f454295746712286198399486fd3a08692916bf17846f9d93f4bdbb'
            '3e041d1838dc5fc83ac76c88a246e71e128fb4b3f26f963b46af4ac9f31d7a74'
            '0cc3d27d7d4fecb67528ba1bd0e1d46c4088f48214cf911d02a769591d7ddfb7'
            'f76d5033dc2913d00ea1d394daa621bf42edcfdd31b4a7336a5cb195283dab92')

prepare() {
  # add initial support for NUC X15
  for p in "${srcdir}"/*.patch; do
    patch -d "${srcdir}/${_pkgname}-${pkgver}/" -p1 -i "$p"
  done

  # place charging limit driver, if you don't need this, comment out it.
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
