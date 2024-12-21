# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

pkgbase=efibooteditor
pkgname=(efibooteditor efibooteditor-qt5)
pkgver=1.5.2
pkgrel=1
arch=(x86_64)
pkgdesc='Boot Editor for (U)EFI based systems.'
url='https://github.com/Neverous/efibooteditor'
license=(LGPL3)
depends=(efivar zlib)
makedepends=(cmake git qt6-tools qt5-base qt5-tools)
source=(git+${url}.git?signed#tag=v${pkgver})
md5sums=('e42651337d1bd1e1e3a1ccc2ffbbb8d5')

validpgpkeys=(
    '9E76A390AAF9772C8448DCCEE4F948F71FEE7375'
)

build() {
    cd ${pkgbase}

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

    cd ${pkgbase}

    DESTDIR="${pkgdir}" cmake --install build-qt6
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}

package_efibooteditor-qt5() {
    pkgdesc='Boot Editor for (U)EFI based systems (Qt5 version).'
    depends=(efivar qt5-base)
    conflicts=(efibooteditor)
    provides=(efibooteditor)

    cd ${pkgbase}

    DESTDIR="${pkgdir}" cmake --install build-qt5
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}
