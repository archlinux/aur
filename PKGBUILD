# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin-git
pkgver=0.2.0.r8.g67d2eb0
pkgrel=2
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images (git version)'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL3')
depends=('libjxl' 'qt6-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'highway' 'vulkan-headers')
checkdepends=('appstream')
provides=('qt6-jpegxl-image-plugin')
conflicts=('qt6-jpegxl-image-plugin')
options=('!emptydirs')
source=('git+https://github.com/novomesk/qt-jpegxl-image-plugin.git'
        '010-qt-jpegxl-image-plugin-add-qt6-support.patch')
sha256sums=('SKIP'
            'aa8438527c072a26cc33114ecbe32417c39adb270176ba70a9d4a39dca105c82')

prepare() {
    patch -d qt-jpegxl-image-plugin -Np1 -i "${srcdir}/010-qt-jpegxl-image-plugin-add-qt6-support.patch"
}

pkgver() {
    git -C qt-jpegxl-image-plugin describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S qt-jpegxl-image-plugin \
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
