# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.11
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
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
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('2bcf289265e25bd50bfc0357e948f4058d8252f9bd24a83897c0c948c757c28d'
            '5f6261777bbff8efd75efc7680e0f9d18329095cee55e6bb41b4e20351179875'
            '8d371c20116671c79a6c88b356b0b6bf0707e009042667ea0fc08e7812a2a212'
            '2c15269817129353e081411a9a188c86a3c5ce20b57e9fb4df6862ed9b2b91ae'
            'b7518a6c7d478e8d448befa3dd1940a91498ae1f3536ad5dbf82465174d1b2fe'
            'aa3c7476b99b35b7eb433cf93d7e8ff0703cd18d412fc540795e5909e2fb862d'
            '51dbc18adbdc0ee2d76b5853931d1fcfb02291ac5a3c59986292fc8fc54ebd79'
            'a5bd505bb6a6f6d65021a121520632193dd1fec99e579d06cc51b7dce15c593e'
            'c77a23f9c1575f9549341306f01e35838561f375f22a4db2c524b8cf1a2d9434'
            '5ec8f76fcc3925c46fed5e604a86f0c5fe733b5edd40eec4c3dfcb3dc2712b2c'
            'c866ce8e5138557b667dfe152f7296880715a514ce31c9540242780a541985c8'
            '4580a8fbad067a5b187abe864ab80d42d8138d0caec394533bec67bf457e4c58'
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
