# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qt6-jpegxl-image-plugin-git
pkgver=0.8.1.r0.g56fc9f0
pkgrel=1
pkgdesc='Qt6 plug-in to allow Qt6 and KDE based applications to read/write JXL images (git version)'
arch=('x86_64')
url='https://github.com/novomesk/qt-jpegxl-image-plugin/'
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'libjxl'
    'qt6-base')
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
    'vulkan-headers')
checkdepends=(
    'appstream')
provides=('qt6-jpegxl-image-plugin')
conflicts=('qt6-jpegxl-image-plugin')
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
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
