# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=aom
pkgname=lib32-aom
pkgver=3.6.0
pkgrel=1
pkgdesc="Alliance for Open Media video codec (32-bit)"
url="https://aomedia.org/"
arch=(x86_64)
license=(BSD custom:PATENTS)
depends=(lib32-glibc aom)
makedepends=(cmake ninja yasm)
source=(https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz{,.asc})
b2sums=('bf97c74f3e59e3cc2431e7b7e3494beffde1b659d1a8f8775b4b47da0c7314b8bf5b9bdf14a9d1d47a8378271f49c9e26676e73509f9e910f1d5a01e79b575bc'
        'SKIP')
validpgpkeys=(B002F08B74A148DAA01F7123A48E86DB0B830498) # AOMedia release signing key <av1-discuss@aomedia.org>

prepare() {
    cd libaom-$pkgver
}

build() {
    # Upstream would like -O3
    CFLAGS="${CFLAGS/-O2/-O3}"
    CXXFLAGS="${CXXFLAGS/-O2/-O3}"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -S libaom-$pkgver -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32 \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=1 \
        -DENABLE_TESTS=0 \
        -DENABLE_DOCS=0

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libaom-$pkgver/{LICENSE,PATENTS}

    cd "$pkgdir/usr"

    rm -r bin include
}
