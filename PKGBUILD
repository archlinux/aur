# Maintainer: Šimon Hacaj <hacajsimon@gmail.com>
pkgname="sail-img"
pkgver=0.9.7
pkgrel=2
pkgdesc="The missing small and fast image decoding library for humans (not for machines)"
arch=(x86_64)
url="https://github.com/HappySeaFox/sail"
license=('MIT')
depends=(
    'jasper' 'libwebp' 'giflib' 'libjpeg-turbo' 'libavif'
    'libjxl' 'libpng' 'libtiff' 'gcc-libs' 'glibc'
)
makedepends=('git' 'cmake')
provides=("libsail" "libsail-common" "libsail-c++" "libsail-manip")
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/HappySeaFox/sail/archive/refs/tags/v${pkgver}.tar.gz
)
sha256sums=('a882f8a88ad1fe3e833abe44fd2120463b4ab27f0b00ed8547c8a9616cc548f1')

prepare() {
    cd "${srcdir}/sail-${pkgver}"
    mkdir ./build -p
}

build() {
    cd "${srcdir}/sail-${pkgver}/build"
    cmake -DCMAKE_BUILD_TYPE=Release .. \
            -DSAIL_BUILD_APPS=OFF -DSAIL_BUILD_EXAMPLES=OFF \
            -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build . --config Release
}

package() {
    cd "${srcdir}/sail-${pkgver}/build"
    make DESTDIR="$pkgdir/" install

    install -D -m644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
