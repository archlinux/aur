# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=efibooteditor
pkgbase=${_pkgbase}-git
pkgname=(efibooteditor-git efibooteditor-qt5-git)
pkgver=r300.d26721d
pkgrel=1
arch=(x86_64)
pkgdesc='Boot Editor for (U)EFI based systems.'
url='https://github.com/Neverous/efibooteditor'
license=(LGPL3)
depends=(efivar zlib)
makedepends=(cmake qt6-tools qt6-5compat qt5-base qt5-tools git)
source=(${pkgbase}::git+https://github.com/Neverous/efibooteditor.git)
sha256sums=('SKIP')
validpgpkeys=('9E76A390AAF9772C8448DCCEE4F948F71FEE7375')

pkgver() {
    cd ${pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${pkgbase}

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
    pkgdesc='Boot Editor for (U)EFI based systems.'
    depends=(efivar qt6-base qt6-5compat)
    conflicts=(efibooteditor)
    provides=(efibooteditor)

    cd ${pkgbase}

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${_pkgbase}/LICENSE
}

package_efibooteditor-qt5-git() {
    pkgdesc='Boot Editor for (U)EFI based systems (Qt5 version).'
    depends=(efivar qt5-base)
    conflicts=(efibooteditor)
    provides=(efibooteditor)

    cd ${pkgbase}

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${_pkgbase}/LICENSE
}
