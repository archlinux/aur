# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin-git
pkgver=0.5.0.r2.g8aa8282
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
options=('!emptydirs')
source=('git+https://github.com/novomesk/qt-jpegxl-image-plugin.git')
sha256sums=('SKIP')

pkgver() {
    git -C qt-jpegxl-image-plugin describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S qt-jpegxl-image-plugin \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DKDE_INSTALL_QTPLUGINDIR:PATH='lib/qt6/plugins' \
        -DQT_MAJOR_VERSION:STRING='6' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
