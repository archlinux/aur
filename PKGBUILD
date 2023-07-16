# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=aom
pkgname=(
    lib32-aom
)
pkgver=3.6.1
pkgrel=1
pkgdesc="Alliance for Open Media video codec (32-bit)"
url="https://aomedia.org/"
arch=(x86_64)
license=(
    BSD
    custom:PATENTS
)
depends=(
    lib32-glibc
    aom
)
makedepends=(
    cmake
    ninja
    yasm
)
source=(
    https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz{,.asc}
)
b2sums=('c47b748e3dc43e39ecb55c4d61ea3d2d4a889bb8c6c399e29e14269757d271cd759a553f5da765bcdf7cd19546b408fce060d5ed3fb13e3aba4f8d22d612bf29'
        'SKIP')
validpgpkeys=(
    B002F08B74A148DAA01F7123A48E86DB0B830498 # AOMedia release signing key <av1-discuss@aomedia.org>
)

prepare() {
    cd libaom-$pkgver
}

build() {
    local cmake_options=(
        -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=lib32 \
            -DCMAKE_BUILD_TYPE=None \
            -DBUILD_SHARED_LIBS=1 \
            -DENABLE_TESTS=0 \
            -DENABLE_DOCS=0
    )

    # Upstream would like -O3
    CFLAGS="${CFLAGS/-O2/-O3}"
    CXXFLAGS="${CXXFLAGS/-O2/-O3}"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -S libaom-$pkgver -B build -G Ninja "${cmake_options[@]}"

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libaom-$pkgver/{LICENSE,PATENTS}

    cd "$pkgdir/usr"

    rm -r bin include
}
