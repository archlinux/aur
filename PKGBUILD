# SPDX-License-Identifier: 0BSD
# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.5.4
pkgrel=0
pkgdesc="Boot Editor for (U)EFI based systems."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Neverous/efibooteditor"
license=(LGPL3)
depends=(efivar zlib qt6-base qt5-base)
makedepends=(cmake git qt6-tools qt5-tools)
source=("${pkgbase}::git+${url}.git?signed#tag=v${pkgver}")
b2sums=('0f15e58ef07ef3c23ee2c11edb8b8147bceb2a10c0d9521cc5dc1ec84ca8c72e3571cb65f553a856ea35d0081a06a7219b41fdd6f9445ab1574c3deefc1ef003')
validpgpkeys=(
    "9E76A390AAF9772C8448DCCEE4F948F71FEE7375" # Maciej Szeptuch <neverous at neverous dot info>
)

build() {
    cd ${pkgbase} || exit

    export BUILD_VERSION=${pkgver}-aur.${pkgrel}

    # Build Qt6 version
    cmake -B build-qt6 . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=6

    cmake --build build-qt6 --config Release

    # Build Qt5 version
    cmake -B build-qt5 . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=5

    cmake --build build-qt5 --config Release
}

package_efibooteditor() {
    pkgdesc="Boot Editor for (U)EFI based systems."
    depends=(efivar zlib qt6-base)

    cd ${pkgbase} || exit

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}

package_efibooteditor-qt5() {
    pkgdesc="Boot Editor for (U)EFI based systems (Qt5 version)."
    depends=(efivar zlib qt5-base)
    provides=(efibooteditor)
    conflicts=(efibooteditor)

    cd ${pkgbase} || exit

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
