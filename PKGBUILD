# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.6.0
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
sha256sums=('2376cca99475235b75053a2cfbc7ed40fd8763d5a516941a664870ff1f3aa98f'
            'SKIP'
            '30f8ea4c4f6e5d0e93e746edc6c45f9f51ce5de51919bacd6dcd9d6ad45c2485'
            '37021ba70f4c721bdca081364ff966e665b44841b9ec8165fa81469dc4f3ac4b'
            'd2d63a9f88e4e902a84af6ec66658a5b9befcc66b8e62472c087ff5f724328c5'
            '0a276d6242bcc2f3baf5cca8574f24b79f0d6933ad15071c967cab6e85a0287c'
            'b2cf2ba543a90fd909f0c982edf1f2283f773d997921fdfee4e436e5ac16352e'
            '5804607b73770d9b26c2c8a8ac49d695c565c7472e4cb87e6ce6f89b6cf07b74'
            'eec88ac7eb7b618f9c2cd61df599a524155e852cb0b99fa248c8bf4efe4ed278'
            '5f9314d3d676591d9fcb3f8a37def8ce77ff4e2d55907b82143051e6d6f2b960'
            '5bae7be9cafca3f98e9dd59c3d103bc983280585044610208152cd43e6b3d78d'
            'a4226a479ff74deddf38cffda99447c18e0175fa2cfdc8b50dbd3473e1d94e2e'
            'ca7161b4991b1915e82a55e3e5f44c7ed34b52daff34062a950697755b99e97e'
            '05b88326d0ad49936412052707a9e65d31c624da299119db8d1f9bd600b4d830')

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
