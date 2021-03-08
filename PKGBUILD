# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=8.2
pkgrel=2
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('gcc-libs' 'protobuf' 'gflags' 'google-glog' 'coin-or-cbc' 'protobuf')
# abseil fixed version since it breaks stuff
makedepends=('cmake' 'pkgconf' 'git' 'abseil-cpp=20200923.3')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('cf40715fa5cfeee88e2c8f5583465182c8dedf60b4eb7c4a967b32ff61ac4302')

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
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_CXX_EXAMPLES=OFF
}

build() {
    cd "$pkgname-$pkgver/build"
    make
}

# https://github.com/google/or-tools/issues/2395
# for testing also build examples
# check() {
#     cd "$pkgname-$pkgver/build"
#     ctest --parallel `nproc`
# }

package() {
    cmake --build "$pkgname-$pkgver/build" -- DESTDIR="$pkgdir" install
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
    rm "$pkgdir"/usr/share/examples/cpp/{BUILD,CMakeLists.txt}
}
