# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=6.9.1
pkgrel=1
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=(gcc-libs)
makedepends=('cmake')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha256sums=('c6fa58741addf9fa59dd990fa933a8137eea7e8e2775b09c430cc7f71dbfd564')
conflicts=('python-or-tools') # because it copies libortools.so to usr/lib

build() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_PYTHON=OFF \

    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    cmake --build build -- test
}

package() {
    cmake --build "$pkgname-$pkgver/build" -- DESTDIR="$pkgdir" install
    install -d -m 755 "$pkgdir/usr/share/examples"
    cp -a "$pkgname-$pkgver/examples/cpp" "$pkgdir/usr/share/examples/cpp"
    rm "$pkgdir"/usr/share/examples/cpp/{BUILD,CMakeLists.txt}

    # TODO: work with upstream to clean this (cmake is still experimental)
    cd "$pkgdir/usr/"
    rm -rf bin share/man share/pkgconfig
    rm lib/*.a
    rm lib/libortools_examples.so
    rm lib/libz*
    rm -rf lib/pkgconfig
    rm -rf lib/cmake/{Cbc,gflags,glog,protobuf,ZLIB}
    rm -rf include/{cbc,gflags,glog,google}
    rm -rf include/{zconf,zlib}.h
}
