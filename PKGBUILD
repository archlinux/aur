# SPDX-License-Identifier: 0BSD
# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=efibooteditor
pkgbase=${_pkgbase}-git
pkgname=(efibooteditor-git efibooteditor-qt5-git)
pkgver=r338.b346c37
pkgrel=2
pkgdesc="Boot Editor for (U)EFI based systems."
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Neverous/efibooteditor"
license=(LGPL3)
depends=(efivar zlib qt6-base qt5-base)
makedepends=(cmake git qt6-tools qt5-tools)
source=("${pkgbase}::git+${url}.git?signed")
b2sums=("SKIP")
validpgpkeys=(
    "9E76A390AAF9772C8448DCCEE4F948F71FEE7375" # Maciej Szeptuch <neverous at neverous dot info>
    "968479A1AFF927E37D1A566BB5690EEEBB952194" # GitHub <noreply at github dot com>
)

pkgver() {
    cd ${pkgbase} || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgbase} || exit

    export BUILD_VERSION=0.0.0-aur.${pkgver}-${pkgrel}

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

package_efibooteditor-git() {
    pkgdesc="Boot Editor for (U)EFI based systems."
    depends=(efivar zlib qt6-base)
    provides=(efibooteditor)
    conflicts=(efibooteditor)

    cd ${pkgbase} || exit

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${_pkgbase}/LICENSE
}

package_efibooteditor-qt5-git() {
    pkgdesc="Boot Editor for (U)EFI based systems (Qt5 version)."
    depends=(efivar zlib qt5-base)
    provides=(efibooteditor)
    conflicts=(efibooteditor)

    cd ${pkgbase} || exit

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${_pkgbase}/LICENSE
}
