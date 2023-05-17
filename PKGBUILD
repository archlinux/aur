# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.7.0
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=(
    '594ABBA066118C7A02D10A80A8AF906D9307FBAD'
    '3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'
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
    "0008-data-Add-Microsoft-Surface-Book.patch"
    "0009-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0010-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0011-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0012-data-Add-Microsoft-Surface-Book-3-15.patch"
)
sha256sums=('853929bd73fba2064b12142dbbee4b3bf84509197ff46a4da559eddf62d32cdf'
            'SKIP'
            '0041920d4d29b02d0e2b05fc63ad9e4b3c4cc28579f3a9a4638a4505d1fb9f6b'
            '1be62a8e1b901cb6f89da71a76f073a03a3c14d56edc936fac7f5eaa71baf420'
            '7b15be0134391de1df67ba6f23bb8f5ae2c820d924b73216b0d45b179f0fbf69'
            '570e905787ebd1b26610ea47faaf245eb1af1d61891ab433a5c6684ffb507ed2'
            'c6558d5f996a360633259b01e036870439eaf1d20f8d1baab18a26f9698bf8a7'
            '4527ef6685744f012ca791b7b118344250b3bec67e1973eba80119876e28ff20'
            '2f0286c0c6cb76bc9c1cd3db44f281754f43ea4a839b0cc604dce12400aafe90'
            'bd4fc2ccabff9830985c8c36f42d3913d7eacf3406731f71a08114f016542601'
            'f93e3769f881c2834f442da0b67fd94ab369d0cc6bdb9b09e15c86b1caa67482'
            'e33b4edb33413d9e97c57bee71b6cdbffb5efb6a83c8452b62307255c1c9b6ce'
            '93a45c1f4755a7fb41572dbe70f3b9f2dcbbcdaf8eb0cf8baf55d897d4309526'
            '5ab4afb7208b91eb93b5dafde1ace9b8139cfd2e7aa47c0e8c977b5d40ae8286')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    meson setup build "libwacom-${pkgver}" --prefix="/usr"
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
