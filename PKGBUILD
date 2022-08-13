# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=9.4
pkgrel=1
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('coin-or-cbc' 'protobuf' 're2')
# abseil fixed version since it breaks stuff
makedepends=('cmake' 'pkgconf' 'git' 'eigen' 'abseil-cpp')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('180fbc45f6e5ce5ff153bea2df0df59b15346f2a7f8ffbd7cb4aed0fb484b8f6')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -S. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_DEPS=OFF \
        -DUSE_SCIP=OFF \
        -DBUILD_SAMPLES=OFF \
        -DBUILD_EXAMPLES=OFF
}

build() {
    cd "$pkgname-$pkgver/build"
    make
}

# for testing also build examples
# check() {
#     cd "$pkgname-$pkgver/build"
#     ctest --parallel `nproc`
# }

package() {
    cmake --build "$pkgname-$pkgver/build" -- DESTDIR="$pkgdir" install
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
}
