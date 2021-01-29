# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.8
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('git' 'libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    '0001-Add-support-for-BUS_VIRTUAL.patch'
    '0002-Add-support-for-Intel-Management-Engine-bus.patch'
    '0003-data-Add-Microsoft-Surface-pro-4.patch'
    '0004-data-Add-Microsoft-Surface-pro-5.patch'
    '0005-data-Add-Microsoft-Surface-pro-6.patch'
    '0006-data-Add-Microsoft-Surface-pro-7.patch'
    '0007-data-Add-Microsoft-Surface-Book.patch'
    '0008-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0009-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0010-data-Add-Microsoft-Surface-Book-3-13.5.patch'
    '0011-data-Add-Microsoft-Surface-Book-3-15.patch'
    '0012-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('9d42ff25bb041cfcafa97c553b01373cad2d4fdc2d5ec1bcadfa30f724980872'
            '07c75867f9386575ad40f22bcd53dced9eb806829c1945c94e98cd0947c86277'
            '53dc7747c60b77a2595f738819335cf484e2f55fb8d5afcc2ac442d79b395a95'
            'e22f9195513bac56f82e0869fd392f757ef2a80c12bee166b69fa6c7be1f63ea'
            'f6b930bd7f89b0a6ee548fbcccae92a214feeca850cd1f2338a856c136ddd639'
            '0f7ece1424585153757081a06db17408e7dbaada3e350f92d03cfb0dbb260e88'
            '06d12286c3b710ab1120bc6bbf77f7342cf0354b122d2739a19f8ff84621f24e'
            'a70fe06e3294e8b486e34bc608d8e3335c07f038300df8ddd2f905659314921d'
            '7e6d55e081195334138fbc6a5a899cfce7a523142333219a5b84868de2ed8468'
            '4a9851d180b7f456503e4e5a729f15274a940180354bbd389130a35c9c7c4ce4'
            'e1e5bb3ea9780af290adfda4bcb45dc84d9ea486e0510e79a768cd0b5befb027'
            'e1a74b313d6b265a7ba398633f56cfb39b0ae9fe8d206add9964a5e27ba13462'
            '2e8075e60bbef74fe9c3539b0a0080efab28912b2552784d8b54dbbf1aaa63e5'
            'SKIP')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    meson build "libwacom-${pkgver}" --prefix="/usr"
    ninja -C build
}

check() {
    ninja test -C build
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
