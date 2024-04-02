# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=9.9
pkgrel=2
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('coin-or-cbc' 'protobuf' 're2' 'abseil-cpp>=20240116.1')
makedepends=('cmake' 'pkgconf' 'git' 'eigen' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('8c17b1b5b05d925ed03685522172ca87c2912891d57a5e0d5dcaeff8f06a4698')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DEPS=OFF \
        -DUSE_SCIP=OFF \
        -DBUILD_SAMPLES=OFF \
        -DBUILD_EXAMPLES=ON
    cmake --build build
}

# for testing, build examples
check() {
    ctest --test-dir build --output-on-failure --parallel `nproc`
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
}
