# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma-applets-weather-widget-2
pkgver=3.0.0b2
pkgrel=3
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt6-5compat' 'qt6-declarative')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('d2e54f742b7ffa51cde6493df6a726d9087ee245825296b9192d072e642dbf23')

prepare() {
    sed -i 's/weatherWidget-2/weatherWidget-3/' ./${_gitname}-${pkgver}/translations/CMakeLists.txt ./${_gitname}-${pkgver}/plugin/CMakeLists.txt
}


build() {
    cmake -B ./build -S ./${_gitname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQML_INSTALL_DIR=/usr/lib/qt/qml \
        -DLOCALE_INSTALL_DIR=/usr/share/locale \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DQT_MAJOR_VERSION=6
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
