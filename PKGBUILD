# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>
# Contributor: Azrael <charles.gueunet+aur@gmail.com>

pkgname=filament
pkgver=1.4.1
pkgrel=1
pkgdesc='A real-time physically based engine'
arch=('x86_64')
url="https://github.com/google/${pkgname}/tree/v${pkgver}"
license=('Apache')
depends=('assimp' 'libc++' 'libc++abi' 'mesa' 'libxi' 'embree' 'libpng' 'zlib' 'oidn')
makedepends=('cmake' 'clang')
conflicts=('mono') # because of /usr/bin/cmgen
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('471863b385227d23d0850efc4ba53b7bc9ecc83be50b51481d767b5bb7fdea86')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i '/add_.*libassimp/d' CMakeLists.txt
    sed -i '/add_.*samples/d' CMakeLists.txt
    sed -i '/add_.*libpng/d' CMakeLists.txt
    sed -i '/add_.*libz/d' CMakeLists.txt
    sed -i '/add_.*libsdl2/d' CMakeLists.txt
    sed -i '/test_bluevk/d' libs/bluevk/CMakeLists.txt
}

build() {
    cd "${pkgname}-${pkgver}"
    [[ -d build_release ]] && rm -r build_release
    mkdir build_release && cd build_release
    cmake -DCMAKE_CXX_COMPILER=clang++ \
          -DCMAKE_C_COMPILER=clang \
          -DCMAKE_CXX_FLAGS="-I/usr/include/SDL2 -DFILAMENT_HAS_EMBREE" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DBUILD_DEMO=OFF \
          -DENABLE_JAVA=OFF \
          -DDENOISE_LIBRARY="OpenImageDenoise" \
          -DDIST_DIR="." \
          -DCMAKE_EXE_LINKER_FLAGS="-Wl,-z,relro,-z,now" \
          ..
    make
}

package() {
    cd "${pkgname}-${pkgver}/build_release"
    make DESTDIR="${pkgdir}/" install
    rm -rf "${pkgdir}/usr/README.md" "${pkgdir}/usr/docs"
}
