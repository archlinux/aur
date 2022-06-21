# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.3.0
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
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
sha256sums=('2fb22a7072cdbcf742d91c38246b0f91bbfd753b934ef5227e31554effb62334'
            'SKIP'
            'e26dc04e660eab2548180d780546e8a10779e087f5b3da305200d33897ba3de8'
            '9020bdc1a58d9bd0c9268176f703c711ac2ff84fd595db58e2c7e4033c359b4a'
            '6fe2d16a69690282fcfd468c99be0adf918a3abb42fc31f4f2438018a1f6ef37'
            '9da12b928fd5d4be0e595687f43edf929335043b7d8d69a7065f43eeadad63b8'
            '5b3d7199e51b7bbae4ecd4c4c3e6b1b9c801f84f765c2a1f0e8d0c00b29c77f3'
            '13bb2669f27c168379465d1f001c0c69270cc3f4dccfd231f2db81b4d7f51fb5'
            'e05236f0d5ca5d6203608e63d4bfdb2ba3a92e3abca15be33e1878685bc4a6e2'
            '071280afba90bcc6de9f3a1b51697034bbdd9cb2327365ed929a40bfa8edd09f'
            '0d78771c2be3038f92687d555db3e974c79c4bf289969af5ce9a139b90397700'
            '0adaa0bca0e61695d3077eee3b852502688e7788e56811248cf7e39d2ef5f82f'
            'b40940d49ea6be8f8e152924c2a0f6a6619185f8f03f7870ae55d972dc70083f'
            'b93b3b92a7f61dad50fa30833cfe89cbd14d9286358a571014ecf015ddd7fe83')

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
