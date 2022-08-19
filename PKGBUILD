# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.4.0
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
sha256sums=('d0d022761e3f9ab23e329583b7d2bd470b0450dfb077caeb22c5a0d66c2bd414'
            'SKIP'
            'c35a556533f7c05b6515b2d3cb2319e7cd16e6fb3d6db8cd8c8496b71735dfec'
            '5856fe9d9b90be0bbf2bcb549d8e9d556f35d745049ea5a47c5371d21b8d3db4'
            '003b70d83f28d090e8609cd31af8f1c31f55061af8d41b65fc469e68e68c4a9a'
            'cc5dcba04f2f5bc577e34452adee616fbe14c25a74b0afb3b8fedb5f6fcca4a9'
            '93b38899da0ec01c4b7f3867b4952c04cd8dfd2ec3fd8e434204b2dc6fb35df5'
            'c878f100f1731da4a7e856cde6c2975bae1a23dac839a80c95ce82f55415c073'
            'd2afac640d0b99bb1f4a993a74683b0b696edff155a75154c1332e46051187d3'
            '57cb891958ee8b6b087e5b396135c26538d1f4009938868dac7c45c1f1a0808b'
            '869f935219ec3bff3f7fa57fcb16dc4d75ac9ee43c780de559a50f70057f4dd2'
            '67d4af120e6c513a39af995cd3b52d2e42bde478b68897ef90c1c619a5dac66f'
            'f31afb2745ba4340c5fef1e0424da63059d9b41260d7f8963482ed89d16c7503'
            '00907868d6d14032071886961c1499981928f21f20c731b54026ccbcd1d0e59c')

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
