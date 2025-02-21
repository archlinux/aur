# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=9.12
pkgrel=1
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('coin-or-cbc' 'protobuf' 're2' 'abseil-cpp')
makedepends=('cmake' 'pkgconf' 'git' 'eigen' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('de7a743c8ec097ab8906c1e00ea782ee8a4fe4ec297e15d7bdf3a187b2f8829c')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DEPS=OFF \
        -DUSE_HIGHS=OFF \
        -DUSE_SCIP=OFF \
        -DUSE_SYSTEM_ABSEIL=ON \
        -DUSE_SYSTEM_PROTOBUF=ON \
        -DBUILD_SAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -Wno-dev
        # -DBUILD_EXAMPLES=OFF \
    cmake --build build
}

# for testing, build examples
# check() {
#     ctest --test-dir build --output-on-failure --parallel `nproc`
# }

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
}
