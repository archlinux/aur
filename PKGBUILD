# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin
pkgver=0.3.2
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL3')
depends=('libjxl' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules' 'highway' 'vulkan-headers')
checkdepends=('appstream')
options=('!emptydirs')
source=("https://github.com/novomesk/qt-jpegxl-image-plugin/archive/v${pkgver}/qt-jpegxl-image-plugin-${pkgver}.tar.gz"
        '010-qt-jpegxl-image-plugin-add-qt6-support.patch')
sha256sums=('8343500ecb9b92fd1fad5dca74d824ce66991c3eac2ff64e1d5757ef98bfcae8'
            '159be60d69cc0b2c8203ebb240cc71e3fbfbf8a2bf17a26ed7e34f564ff07ab8')

prepare() {
    patch -d "qt-jpegxl-image-plugin-${pkgver}" -Np1 -i "${srcdir}/010-qt-jpegxl-image-plugin-add-qt6-support.patch"
}

build() {
    cmake -B build -S "qt-jpegxl-image-plugin-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DKDE_INSTALL_QTPLUGINDIR:PATH='lib/qt6/plugins' \
        -DQT_MAJOR:STRING='6' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/usr/share/kservices5/qimageioplugins"
}
