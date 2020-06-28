# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.4
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
    '0001-meson.build-ignore-Makefile.in-when-installing-data.patch'
    '0001-Add-support-for-Intel-Management-Engine-bus.patch'
    '0002-data-Add-Microsoft-Surface-Pro-4.patch'
    '0003-data-Add-Microsoft-Surface-Pro-5.patch'
    '0004-data-Add-Microsoft-Surface-Pro-6.patch'
    '0005-data-Add-Microsoft-Surface-Book.patch'
    '0006-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0007-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0008-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('e2a38bbcb5041f0606f3f06d8db00ae6af364382f0f7d072510a73704f4be36a'
            '2bb41c3b1b23670c5f5ccf2fbb851827b6fbcaa8cead8f56de571a740e4e21b2'
            'c728251446d677df44635e2329fe9cb31077b500e587fd505c7b2b5fe5d15a60'
            'd75087e2bcb05f373609c2f4e8ca114fd681ebed2234624aaca265bb7f1a9c17'
            '6fdae3834af15bcb68917eb2a3fd29bb7fd384025c7226659681b6f030f65f1f'
            '2a0c08be2b3273bd439bac0b373e20335631e29591f2d6cd8b33ad7fce142e3c'
            '2e482b9cf1f5f1308ca4a2f38aea0874cea0cee7fb52897c738d31570c73d07e'
            '15ed034d7e359a59051ec2d8f0d2508bf725ec42f8499209de8f2ecba4eeef82'
            '7b66af8c01423d5c7b93ddb1b77910c6be91e8a332cc16f3c42ff7ac3ab7ddfb'
            '90061797ccde3ccf9960ffdc4d0e7e767dedacd68c039ed35450d5ea593066e6'
            'SKIP')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
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
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}"/usr/lib/udev/rules.d
    cd tools
    ./generate-hwdb > "${pkgdir}"/usr/lib/udev/hwdb.d/65-libwacom.hwdb
}
