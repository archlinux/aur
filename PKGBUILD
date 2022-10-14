# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.5.0
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=('594ABBA066118C7A02D10A80A8AF906D9307FBAD')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.xz"{,.sig}
    "0001-Add-support-for-BUS_VIRTUAL.patch"
    "0002-Add-support-for-Intel-Management-Engine-bus.patch"
    "0003-data-Add-Microsoft-Surface-Pro-3.patch"
    "0004-data-Add-Microsoft-Surface-Pro-4.patch"
    "0005-data-Add-Microsoft-Surface-Pro-5.patch"
    "0006-data-Add-Microsoft-Surface-Pro-6.patch"
    "0007-data-Add-Microsoft-Surface-Pro-7.patch"
    "0008-data-Add-Microsoft-Surface-Book.patch"
    "0009-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0010-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0011-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0012-data-Add-Microsoft-Surface-Book-3-15.patch"
)
sha256sums=('40b69a4c38bbcbc80b1231bc115551107ebbc0ba14d2ad1c3e54355dcd876816'
            'SKIP'
            'df74a5120abd8b36387910f7a10bcc6e55d27d78e7870fac86d0209cfe0ec690'
            '2479522c18575c673c822614d680d59d4a3e61aab53bcfc8b214504924db3b77'
            '120efc9ccfcf159f8f5bce9d48838dd9febc3661827cf37bd4d2b01f78487569'
            '167c55b625c98b9620ae65b82bb6b83ad59326a73ef2952e65fb57622ab9d43b'
            '85e767c6b981c83a80e435f9aa313eac92b6e5056272e484e9881de91fc06965'
            'dd9c3ad59d6f51368616afc1485abab09a5d5300fb48a92fb03f1e59074d3f11'
            '8f4572ef5a45a09160a85e2483bedc53f0e299ddae681b9b24f7b6b2dcc7241a'
            '20267f19f35476fa915cdbcec310995efb6af0d64ba0ebc321b1661fe686ba26'
            '44770f5dc6d019021f5ee8dd59f8fca2e2b687f817d4f889d635c4e18aa5a7a4'
            'a13b958804c3a76e8feab26b544552ae6f536b9dcf1391128537be597eb6fc80'
            '4db44bd2f0923325dbcc95cb83bd2507d9c7dcecebcaece3f78c183dca22f737'
            '4e8786a24b412f51c07db9f45e72da532c2524ff4ba8a71339a6ba3a021a37d7')

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
    # disabled for now...
    # ninja test -C build
    true
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
