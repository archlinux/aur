# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.5
pkgrel=1
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
sha256sums=('c8809fe2b66f14347b6adfe2375088f678bd4381a186407dc210ee5561fb2e54'
            '4954a859dc0ea049aacca09b960de75384fcb93d55b2eac6880ae4467ed2a62e'
            '3b8707b6158b6f362326bcf63ec30bd9d78d30115a6ad5861730296b7b8346e0'
            'c531a7c2f4bb9b77825d10db9f7afc362db180af5cdd14b9c6c6aaee0983e175'
            'b968c7c44047c4d46e3e813d927987ee95f8f574bfc8b2ad2957355cc4921964'
            '37cc1991df66c0d446f83ce40faf489999a1ebf429f7c765391422d808c5428f'
            '0c8252fc1ac89d12bb2ff796efa63a7f19191a2b8c4860435dc7bacdd279ccf8'
            'dd79ead5a21871c02b9ad9cea2c976c77fabc418389a3f07212a7ee46a464f98'
            'b5ec92ab67ddc06d81a51c731ec331935fef45cba0f8cec589cc9394f1037b34'
            'ccb0c301697404b1b703468fc9c03327e9e8b646855e9050f82b18e7316ef2f3'
            '9cd9f04dd3e194e24a32f699fe2fe07c3c4c943032eb1e9c9fa278f49540fe0b'
            'cc12eedb8e38d9b05f93da32aa9acf2280b7b560381569cba55ea4f98b9c5ddb'
            '6b349fb73c8edcf0288d17c49049648214924846b6a58914c2ed3477ff36d47b'
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
