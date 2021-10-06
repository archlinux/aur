# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin
pkgver=0.3.0
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
sha256sums=('20f43cc0fa7a3589211ce060c555d5c4c92cc5edc88082975f13277dcda26e5b'
            'aa8438527c072a26cc33114ecbe32417c39adb270176ba70a9d4a39dca105c82')

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
