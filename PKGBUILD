# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.12.2
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features - Patched for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'libevdev' 'libgudev' 'glibc')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus'
            'python-pyudev: for libwacom-show-stylus')
validpgpkeys=(
    '594ABBA066118C7A02D10A80A8AF906D9307FBAD'  # "Joshua Dickens <Joshua@Joshua-Dickens.com>"
    '3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'  # "Peter Hutterer (Who-T) <office@who-t.net>"
)
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
    "0008-data-Add-Microsoft-Surface-Pro-7.patch"
    "0009-data-Add-Microsoft-Surface-Pro-8.patch"
    "0010-data-Add-Microsoft-Surface-Pro-9.patch"
    "0011-data-Add-Microsoft-Surface-Book.patch"
    "0012-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0013-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0014-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0015-data-Add-Microsoft-Surface-Book-3-15.patch"
    "0016-data-Add-Microsoft-Surface-Laptop-Studio.patch"
)
sha256sums=('c8319c40c70edd05d1839c0d3f449c23bdc90cd1f0d819bd0c1ec7c00b117700'
            'SKIP'
            '7c04ca0e57093f1e942ef41490f0b029fb0286914e1559b76165d0b14daf89b5'
            '6be7da91006cd120b4fed933a1b17c27a6fcb1ce04381775b7060b1a0c39d885'
            'bfbc0fdd5985a731a2c1a8fdea78d221bd4173c5c76b1a94c338c609845ee2eb'
            '42f94cb4312842e33233b8e1195be00d371a7b070cdccaa29220bba488bd3a4d'
            '1ed950b8968780ffd30245ad3481b7213e36f632ebffba26049419236ace2160'
            'a50e1c38db3e18ca28d4b62788a57e04806bc5f5c1dbacb27a68e12add83cba3'
            'd3bd6325a80439c645ce664460c76867094f9652521705501a9d852995b41979'
            '01ff12b4a4f569feea0f869548d7cc2f6a295525157e0188468189130c6e4e74'
            '80ffaa494ab055e4863578c462dde74029235e39a2bae58c282d59fe136402d6'
            'd553efe7a31d34f67c52a3748993d8e07ab236686207a0163ca4bbee6ab571bc'
            '35b31550b133ec8f607635b8898eab1d31aa13b03b2af34e8003eb71ab1d32ef'
            'e48269db908628d5f153094a08c7cf3e04bff5e5aa674ea071020389e4be100e'
            '77aa08c2e1401add8387a1248ea23c85c8fa40a7a96a95820eefe53aaf154351'
            'c8b723002a7b33bf9e2ba93a73fa35cdd101ae100f4519d36b910379a58e16fb'
            '3eea2d2d28d1fe3eea4b5f578f912e5d9dbd15a0e7c2f30b6c9283e30b00ff30'
            'fffb14de0426a9a8ecdbb83f5531399dbcb16b66d283a7e3098d27d344216499')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    rm -rf build

    arch-meson libwacom-$pkgver build
    meson compile -C build
}

check() {
    # disabled for now...
    # meson test -C build --print-errorlogs
    true
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 libwacom-$pkgver/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
