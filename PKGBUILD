# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin-git
pkgver=0.2.0.r0.geb424dd
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images (git version)'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL3')
depends=('libjxl' 'qt6-base')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'highway' 'vulkan-headers')
checkdepends=('appstream')
provides=('qt6-jpegxl-image-plugin')
conflicts=('qt6-jpegxl-image-plugin')
source=('git+https://github.com/novomesk/qt-jpegxl-image-plugin.git'
        '010-qt-jpegxl-image-plugin-add-qt6-support.patch')
sha256sums=('SKIP'
            '2058af22093781d6d675372fc177090416f667235d49342657c14b403f66271d')

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
        -DQT_MAJOR:STRING='6' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
