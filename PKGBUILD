# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.7
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
sha256sums=('717886cb815bfb7393fb3163615c72d2bfda76f924e1e48c0852d4a667af0323'
            'c337255d52f42107b05be6e7ebf38c1797ba8eac209ae94aec08a5a876659a4c'
            'dcc39c283c461c600868a6e82445577811e1c5b0a967b51c054c99571421d170'
            'c103ed241afe5618c0b6b67664eb7b0ab28f976edc7f921383f4a89ffd5005eb'
            'd041d860b7f1baca20d3d79908e690931671f62f2207b9ed9ddebf36fbce97ed'
            '60bfcc69740e3363ebf3b8934737765b584557cf02cc0a5ba135a91abe92146d'
            '4f1319251911a57559f8b0d0eb073f07e79e71e1e30ec9aff26639eb044ee9cb'
            '7d317b1a73522083956900d606f7414301c596542a2c420526c5b106f71642bc'
            '5c390a438360affdea4b0a2cb866734a0ccc3725bbac54b617a0118a76a1a9ed'
            'b81f1ca39996e4c49cdec80c2c395e158d60ac46ed7a223665976180c8c934ee'
            '7e6ae8b0a3d5382258ecb42a482ac0dfed1fd148edb4b2f5c0980f391442ab9a'
            '53ed7707cc9a31ac1ee9e326fe499126a5b61c787adf1f1dc28d709159539666'
            '3c875f3bc88c6291528be98bc549e672a0b68640c9cb889d14efb552007b271d'
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
