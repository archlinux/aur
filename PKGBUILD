pkgname=openloco
_pkgname=OpenLoco
pkgver=23.08
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('i686' 'x86_64')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=()
makedepends=('cmake' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-sdl2' 'lib32-libpng' 'lib32-openal' 'yaml-cpp' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f138131af435eed78bea95711b78d851796ae6945a1673a0febbcf7020f91d86')

prepare() {
    gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
    cd ${_pkgname}-${pkgver}
    sed -i  's/option(OPENLOCO_BUILD_TESTS "Build tests" YES)/option(OPENLOCO_BUILD_TESTS "Build tests" NO)/' CMakeLists.txt

    [[ -d build ]] && rm -rf build
    mkdir build && cd build

    export CXXFLAGS="$CXXFLAGS -m32"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../ -DSTRICT=Off
    make
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    cd ${_pkgname}-${pkgver}/build
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

