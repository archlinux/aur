# Maintainer: Marc Tiehuis <marctiehuis@gmail.com>

pkgname=zig
pkgver=0.2.0
pkgrel=3
pkgdesc='a programming language prioritizing robustness, optimality, and clarity'
arch=('x86_64')
url='https://ziglang.org/'
license=('MIT')
depends=('llvm' 'clang' 'libxml2' 'zlib')
makedepends=('cmake')
source=("https://ziglang.org/download/$pkgver/zig-$pkgver.tar.xz")
sha256sums=('29c9beb172737f4d5019b88ceae829ae8bc6512fb4386cfbf895ae2b42aa6965')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/../force_dynamic_llvm.patch"
    patch -Np1 -i "$srcdir/../no_stage2_artifacts.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DZIG_LIBC_LIB_DIR=$(dirname $(cc -print-file-name=crt1.o)) \
        -DZIG_LIBC_INCLUDE_DIR=$(echo -n | cc -E -x c - -v 2>&1 | grep -B1 "End of search list." | head -n1 | cut -c 2-) \
        -DZIG_LIBC_STATIC_LIB_DIR=$(dirname $(cc -print-file-name=crtbegin.o))
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    make DESTDIR="$pkgdir" install
}
