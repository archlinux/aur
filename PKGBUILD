# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.2.1
pkgrel=1
arch=(x86_64)
pkgdesc='Boot Editor for (U)EFI based systems.'
url='https://github.com/Neverous/efibooteditor'
license=(LGPL3)
depends=(efivar)
makedepends=(cmake qt6-tools qt6-5compat qt5-base qt5-tools)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/Neverous/efibooteditor/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('27d8e6d7bb0704a1dd3c89ad82dbc9d4')

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
    pkgdesc='Boot Editor for (U)EFI based systems.'
    depends=(efivar qt6-base qt6-5compat)

    cd ${pkgbase}-${pkgver}

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}

package_efibooteditor-qt5() {
    pkgdesc='Boot Editor for (U)EFI based systems (Qt5 version).'
    depends=(efivar qt5-base)
    conflicts=(efibooteditor)
    provides=(efibooteditor)

    cd ${pkgbase}-${pkgver}

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
