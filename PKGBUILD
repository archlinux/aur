# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname=libwacom-surface
pkgver=0.33
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/geoffholden/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('git' 'libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    '00_mei-bus.patch'
    '01_surface-tablet-data.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('faf69fa3795a5147665b285f28d82c0977a3870522c98ffccaf819730089599e'
            '9b7f8d681bf12e81e21cde33b7d77b10b4f2a78f3d0c46c5efe147c278c24bf9'
            '94f8a3371f30f4a38d6d2290f5160d5f5ba7a7cd6e63bee95686a67a3c19dbf2'
            'SKIP')

prepare() {
    cd "libwacom-${pkgver}"
    patch -p1 -i "${srcdir}/00_mei-bus.patch"
    patch -Np1 -i "${srcdir}/01_surface-tablet-data.patch" || true
    # If the patched source has been cached this will fail to apply, ignore that with `|| true`
    # XXX: There must be a better option?
}

build() {
    cd "libwacom-${pkgver}"
    ./configure --prefix="/usr"
    make
}

check() {
    cd "libwacom-${pkgver}"
    make check
}

package() {
    cd "libwacom-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
    cd "tools"
    ./generate-udev-rules > "${pkgdir}/usr/lib/udev/rules.d/65-libwacom.rules"
}
