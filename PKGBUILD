# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
# Contributor: Dreieck <oid-maps at seznam dot cz>
_pkgname=RTKLIB
pkgname=rtklib-qt
provides=("rtklib-qt")
pkgver=2.5.0
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning. QT port."
arch=('x86_64')
url="https://github.com/rtklibexplorer/RTKLIB"
license=('BSD')
groups=('GNSS')
depends=('glibc' 'gcc-libs' 'libglvnd' 'qt6-base')
optdepends=('qt6-serialport' 'qt6-webchannel' 'qt6-webengine' 'qt6-location' 'qt6-declarative')
conflicts=('rtklib-qt-git')
source=("https://github.com/rtklibexplorer/RTKLIB/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2229dadd2e71c7ef3a2cc97c11903a900a661e56c39fd0be7450d932685ce249')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/app/qtapp"
    qmake6
    make -f Makefile
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/app/qtapp"

    # Install libraries
    make -f Makefile install INSTALL_ROOT="${pkgdir}"

    # Install binaries
    ./install_qtapp
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/RTKLIB_bin"/*

    # Move icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/64x64/apps/" "${srcdir}/${_pkgname}-${pkgver}/app/qtapp/icon"/rtk*.png

    # Install licence
    install -Dm644 "${srcdir}"/"${_pkgname}-${pkgver}"/license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
