# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.10
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
sha256sums=('8ac1314696fb3556232d6c43b524064a172c25dbf24f230a774c265ecb616050'
            'fcc43235097142335f02bedfe3a77f6438896a0e28add68b515dae3b80e4fbfb'
            '6a69ae3499b04fdf3bd420fec348beda90ab572405c5ed48e57c1aa2fa134976'
            '70dc732f858f54c7ee8ec2ae23372e66a2cbc0a31bd0089aa9d2fdf171708cfb'
            '56e2b1af230e676f4ce275c7407ad1bc2aa08fbf502032d1c02356407530702c'
            '63e51707279045fbc92b7708e8afbc387fea8450a9e86cdd5e277c780296e4bc'
            '60ee616fa0daf70ca3b61eb6148b1a6a13158f8160ff7463bdd89b795cb29f29'
            '3e282597007a916428da5e80fd0b6b4ba19806cbf8e81f67f6ebae00391f7577'
            '2a3978b8ea48a66a01fb93463b56da7d91e491a23404632bcb5861cc48d08cdd'
            'e52ac339ab225abcb2582d155e1f980dff93ab8cf5157ae950ded185980bd8e3'
            'a651b98bce0714d6f5180daeb55b954e743522ccdbf7b1e4b0c1a842732caabd'
            'f6c98c4597a786f967b3c02b9c93e40932a162cc4e279daf7abd4316b4265291'
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
