# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.3.2
pkgrel=1
arch=(x86_64)
pkgdesc='Boot Editor for (U)EFI based systems.'
url='https://github.com/Neverous/efibooteditor'
license=(LGPL3)
depends=(efivar)
makedepends=(cmake qt6-tools qt5-base qt5-tools)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/Neverous/efibooteditor/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('9efe1dcec37561b0697d16ef303804eb')

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
    depends=(efivar qt6-base)

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
