# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.12
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
sha256sums=('f5fce00cc3fa80e6bad42c6baa96480014ef7244a3da235b5bb2fc270c6812f5'
            '73ab975b884bf45269c680fcfd6c4ee96e17f984b98978b3301d5cb492bee733'
            '12d054857e2bd1bdcbdda55dd326928f386916284aed3e64c87fd8221ab25338'
            '2405d843de802644eb3bd9cd8f33c5def1d6b985b69b59e0a9b0b83a89b6949e'
            'c02b0444d411f4485de7b5c34ddc237ffe8800386adf64642f4ab78b64512352'
            '5e376b3a90ac9d8ff080462d7b2ad5a126696601c184f47ac029d5ee8d92e944'
            'cc61efcac4b62437a8b03186da837482305e684e055bf6c668328f820cf31896'
            'b24a49d1ef7f16b6af37196d074e99fc7d059c6de3c40bb72a426c9708daa7eb'
            '21f0dab7f1727b7ac1f0491c1758c3b839017cba6e97790e8bf11ff82a957e03'
            'b4263d845e180b6deb94002bd9c6fba1b7243994e37fb7b9ec336a8ad4b58683'
            'bd5140879a449a3ca5443d7cae7c32426a2ffb78fafe20ad5f1998b0d226d40f'
            '290450d604f78bbd956eddb69f79f8d56f8ed1a5ccbb5e88e22fa84fa2fceb4f'
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
