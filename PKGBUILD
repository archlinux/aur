# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.1.4
pkgrel=1
arch=(x86_64)
pkgdesc='GUI for editing EFI Boot Manager entries'
url='https://github.com/Neverous/efibooteditor'
license=(LGPL3)
depends=(efivar)
makedepends=(cmake qt6-tools qt6-5compat qt5-base)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/Neverous/efibooteditor/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('c8f520119c4145f21d4f363f2fe62612')

build() {
    cd ${pkgbase}-${pkgver}

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
    pkgdesc='GUI for editing EFI Boot Manager entries'
    depends=(efivar qt6-base qt6-5compat)

    cd ${pkgbase}-${pkgver}

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}

package_efibooteditor-qt5() {
    pkgdesc='GUI for editing EFI Boot Manager entries Qt5 version'
    depends=(efivar qt5-base)
    conflicts=(efibooteditor)
    provides=(efibooteditor)

    cd ${pkgbase}-${pkgver}

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
