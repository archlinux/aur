# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=8.0
pkgrel=1
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('gcc-libs' 'protobuf' 'gflags' 'google-glog' 'coin-or-cbc' 'protobuf')
makedepends=('cmake' 'pkgconf' 'git')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz"
        "pkg-conf.patch")
sha256sums=('ac01d7ebde157daaeb0e21ce54923a48e4f1d21faebd0b08a54979f150f909ee'
            '2fc50395b8d835543df1172f3b1cddeac2d50b1d8fb7916d4268d6b3b21230a3')

conflicts=('python-or-tools') # because it copies libortools.so to usr/lib

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/pkg-conf.patch"
    cmake -H. -Bbuild \
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
        -DBUILD_absl=ON
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build build
}

#protobuf test fails
#check() {
#    cd "$pkgname-$pkgver"
#    cmake --build build -- test
#}

package() {
    cmake --build "$pkgname-$pkgver/build" -- DESTDIR="$pkgdir" install
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
    rm "$pkgdir"/usr/share/examples/cpp/{BUILD,CMakeLists.txt}
}
