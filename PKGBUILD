# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.7.0
pkgrel=3
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
sha256sums=('853929bd73fba2064b12142dbbee4b3bf84509197ff46a4da559eddf62d32cdf'
            'SKIP'
            '4fd78cf73f4f9c39f21cb63f084bf81d4d863d4bda9fcd98ef9a5c73d4e60ca1'
            'de33c691c30e1e41d2bde9c4f1fd2c223e43929946a986c404837faf62979615'
            'bf5813eaa28fa8ec237b7bd2c97084b32d4dc2e51516e1f7c4327eb97eb91ded'
            'a03d5e2831fceb004dc1d996b5a2bc77f7635454b635acfac5269dbdc92f9fd8'
            '82216bbd183d0814a9ade1420f44eddec94a48d28ed3f70301fc030975966aac'
            'ce94a3d93c3d729a4146f97b8b74384e14df9bb99b50ce639c218b5c88798b8c'
            '4c4d3af8b63d3099b3586911a1eb9aa1c83b1d50b5de5c1f6855cf08100d1fda'
            'aa1285286eb685b2ea4f8869f5980bf85e5af15793c3c3f22fb4ddda241edba8'
            'b2dfd6becc1f0abefe57c05b6a65f1428ec37d61cb4bca0ade92a55ccdba5ba8'
            '5182fbd4e2bdd35cbc8aae2fb3786f633d4c97405aead570a00048699aa67bd9'
            'd62497be1f8bc947a14b5e1e2be9ec3ed2b94634dd99a05947cc60f2604691d7'
            '1cb35a7e0a022cc592c580bb8303a47b8e5e01d6e26cb0ac11e1b298fb540821'
            'f9662bf7db56c1754dba855d20abb1eb13f0f0862dd703106d04d386c5a01899'
            '04ca5078efaee5e9eb48dfe65dc39830bc26aebe1073250040b32defb64b2800'
            '43e7d71db1e35ef75feffd0c6e4cc1639b0f8dc542014919bb1360b496120ca0'
            '439ac1051eaf73e81d8f4b1ef02662808944eb92cd4a2fc2bb184ad376098cdd')

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
