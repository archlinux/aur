# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.4.1
pkgrel=2
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
    '0012-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('140de2c9ed7350248f20137942f46c48c84468b1e82169cea3c56c211199c461'
            'a41bab123588c5c67c8a05e01338b13f13c59f29695084cd9b6ce8e585e82a3a'
            '73d4cfd588a568775fe2a6d859a7223c48b6c17e8ccde7e3691b7ab30f9fefe6'
            'ca2f7a787ac80abcf9cb022ee87c2923ab6636e9fad181b9d6c28d153c046ea3'
            'b49f60e700d1cce47d59145ad86df4a50a57b1ea577d4958c18252a40fd3c2d9'
            '1b58b993a57669bba910794df7949c77af281813c56edb7eee9205744003fd26'
            '5041c7c8b216d223f5e33773fcd430d36ca4ca67b9ee9c7ace6bfb077c20e9b9'
            '4478ba5fdfb032e5841f29d16ad01711a6ad3d426bccf22f2c0901621987f999'
            '5a039a3633523297f1aa34f01bbe43272999201659a3f11f14d343e0d634f438'
            '8a7470b8a4bf4d8fbd29fa6f191bafc3bb34f76aee4c696b9308bb8b63f91ea8'
            '937ecf67fa4e47dafd5a5ca7bb84de8db185c990ff50988966af51e7f9274ffe'
            'cc670a133023308d62f24d9e853673db9644337ebad4e8ed5be55785e2c0f6e2'
            '07839c542940776c402168c7b73c04b346ba7557eb3f25a23a49893aff86ab08'
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
