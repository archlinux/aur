pkgname=openloco
_pkgname=OpenLoco
pkgver=23.08.1
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('i686' 'x86_64')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=('sdl2' 'libpng' 'openal')
makedepends=('cmake' 'sdl2' 'libpng' 'openal' 'yaml-cpp')
if [[ "$CARCH" = "x86_64" ]]; then
    depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-sdl2' 'lib32-libpng' 'lib32-openal')
    makedepends=('cmake' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-sdl2' 'lib32-libpng' 'lib32-openal' 'yaml-cpp')
fi
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"openloco.desktop")
sha256sums=('2d48d5952ed0bc619dd422cc7012434d59e5910ec5e15364ab1370429921766e'
            '57512f00144c1e0d2cc91c3adbf38460d5ec1223afc27bd16e1271760bce02ae')

build() {
    cd ${_pkgname}-${pkgver}
    [[ -d build ]] && rm -rf build
    mkdir build && cd build

    export CXXFLAGS="$CXXFLAGS -m32"
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DSTRICT=Off -DOPENLOCO_BUILD_TESTS=off ../
    make
}

package() {
    install -Dm644 "${srcdir}/openloco.desktop"			"$pkgdir/usr/share/applications/$pkgname.desktop"
    cd ${_pkgname}-${pkgver}/build
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

