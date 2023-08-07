pkgname=openloco
_pkgname=OpenLoco
pkgver=23.07
pkgrel=2
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('i686')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=()
makedepends=('cmake' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-sdl2' 'lib32-libpng' 'lib32-openal' 'yaml-cpp' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98207b49ce3af3f2bc6471ecb519ec8c82668b4e551eb39c444d2f3a367dd20b')

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

