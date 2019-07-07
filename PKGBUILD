# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=or-tools
pkgver=7.2
pkgrel=1
pkgdesc="Google's Operations Research tools."
arch=('x86_64')
url="https://github.com/google/or-tools"
license=('Apache')
depends=('gcc-libs' 'protobuf' 'gflags' 'google-glog' 'coin-or-cbc' 'protobuf')
makedepends=('cmake' 'pkgconf' 'git')
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz"
        "pkg-conf.patch")
sha256sums=('13a4de5dba1f64e2e490394f8f63fe0a301ee55466ef65fe309ffd5100358ea8'
            '177a5f656e6571ab60634167d47d0924e0c71c53680b620023bd9e76e36b9b82')
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
        -DBUILD_PYTHON=OFF \
        -DBUILD_absl=ON
}

build() {
    cd "$pkgname-$pkgver"
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
}
