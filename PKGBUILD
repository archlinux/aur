pkgname=lib32-intel-gmmlib
pkgver=22.5.0
pkgrel=1
pkgdesc="Intel Graphics Memory Management Library — 32-bit"
arch=(x86_64)
url="https://github.com/intel/gmmlib"
license=(MIT)
depends=(lib32-gcc-libs)
makedepends=(cmake)
provides=(lib32-gmmlib)
conflicts=(lib32-gmmlib)
replaces=(lib32-gmmlib)
options=(!emptydirs)
source=("${url}/archive/${pkgname#lib32-}-${pkgver}.tar.gz")
sha256sums=('a3f37dff076503b833ce2dc5c0f9cf854ad706c7857fa6a70972716342efe523')

build() {
        export CC="gcc -m32"
        export CXX="g++ -m32"
        export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

        cmake -B build -S gmmlib-${pkgname#lib32-}-${pkgver} \
          -G 'Unix Makefiles' \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=lib32 \
          -DRUN_TEST_SUITE=ON \
          -D ARCH=32 \
          -Wno-dev
        cmake --build build
}

package() {
        DESTDIR="${pkgdir}" cmake --install build
        rm -r "$pkgdir/usr/include"
        install -Dm644 gmmlib-${pkgname#lib32-}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
