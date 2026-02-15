# SPDX-License-Identifier: 0BSD
# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.5.6
pkgrel=1
pkgdesc="Boot Editor for (U)EFI based systems."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Neverous/efibooteditor"
license=(LGPL3)
depends=(efivar zlib qt6-base qt5-base)
makedepends=(cmake git qt6-tools qt5-tools)
source=("${pkgbase}::git+${url}.git?signed#tag=v${pkgver}")
b2sums=('e1b2fcad747003063b16ac609e8654698e3e1bb2aa73e4e23fde7fc455351a30a200388e527b2e90eaea5793c551e437847fdd978dd5e96dc4724ff9b01d88ca')
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
