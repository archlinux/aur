# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler-git
pkgver=3.16.0.r89.g44eaa553
pkgrel=1
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
depends=(
    'arrow'
    'binutils'
    'fmt'
    'lua54'
    'mosquitto'
    'nlohmann-json'
    'protobuf'
    'qt5-base'
    'qt5-multimedia'
    'qt5-serialport'
    'qt5-svg'
    'qt5-websockets'
    'qt5-x11extras'
    'zeromq'
)
makedepends=(
    'cmake'
    'clang'
    'git'
)
provides=('plotjuggler')
conflicts=('plotjuggler')
source=(
    'git+https://github.com/facontidavide/PlotJuggler.git'
    '0001-lua54.patch'
)
sha256sums=(
    'SKIP'
    '3783f1e19f8bc6d64d48a7d68899d43df30fe23c577f4e4cf25c151c25e653fc'
)

pkgver() {
    cd PlotJuggler
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch -Np1 -i "${srcdir}/0001-lua54.patch" -d "${srcdir}/PlotJuggler"
}

build() {
    cd "PlotJuggler"
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
    cmake --build build
}

package() {
    cd "PlotJuggler"
    DESTDIR="${pkgdir}" cmake --install build
}
