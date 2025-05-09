# Maintainer: Yu-Hsuan Tu <dobe0331 at gmail dot com>
# Contributor: Dreieck <oid-maps at seznam dot cz>
_pkgname=RTKLIB
pkgname=rtklib-qt
provides=("rtklib-qt")
pkgver=b34k
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning. QT port."
arch=('x86_64')
url="https://github.com/rtklibexplorer/RTKLIB"
license=('BSD')
groups=('GNSS')
depends=('glibc' 'qt6-base')
conflicts=('rtklib-qt-git')
source=("https://github.com/rtklibexplorer/RTKLIB/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('32b9c7db6e0455e13fa0287b2fe2138c3c27b6c51d35a33b4bfcb92212ae0f66')

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
