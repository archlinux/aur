# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.10.0
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
sha256sums=('3f8ef37de78ac3d08af1bdcb5d5828ec8284dcb7154bbec4995238728914aa0e'
            'SKIP'
            'a48d8009135e34b5a6e5ce7655167ff0cf371bc33610c49132bd1cd8922a3ba7'
            '79ca3bca1c0635b0d49dfa189b36e9ee198a1b7ef7b6688dd473864f496ea7d2'
            '2c6ccc2555829085482a9ac07db3be3970da39febaebdc4f5e1ee72ec8ee4090'
            'be00652d92d8883c01fe0caeaab2ce0c2601dd8c5364e17768e56130c883e2a0'
            '636e8b724b694eb33066cb486f62c10ae490fc22c76d82a4bd43c1b1705fec9d'
            '96ceafb79ed3247c3008d51b4ff84b00fc59b3ae2c4a1147b747e04e3e186826'
            '98c30e7e336d3ee99251ec95332a3940fbb70208e302a430d6c4821c5524f784'
            '09cb5fcf17185e7c9f51bef673f1c2046b8c9890fafe6ab4fd8b47f196c7dd47'
            '94125d8059d6f093c13c8ed1a4af000476701760d1478703f325feb751a46783'
            '9e75a46ec9a68662842b61ce7525b5498515a9ec6cb0cf7f3beb93e1d54dd75c'
            '38ba71d545cc3a087db2dc736b54a0207ac790d1cc07d5081418ffcada1074db'
            'add6714be40db235e869599bf19c5120c53ad002bd24506f0ef32781df92835f'
            'e47f4ed69a4b5a16d609185a20acb950bad14a3b6e3d024a37b350d9328b6d40'
            '058a476aaa2799a4cfcd04b8ddd67bd3770df2b812b42bc8df1ea5b286d8c652'
            '4284e113f1f34f7139805692fdb11c6b75ef1b647eaabc75af50f7acd23300a1'
            'a9aca842b9372e3f4a397110a0768250b001dc4a5be1715af1081681ec7ebf4b')

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
