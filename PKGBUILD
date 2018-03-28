# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.2.0r2479.5b00dee0
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='http://ziglang.org'
license=('MIT')
depends=('llvm' 'clang' 'libxml2' 'zlib')
makedepends=('cmake')
provides=(zig)
conflicts=(zig)
source=("git://github.com/zig-lang/zig.git")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$provides"
    patch -Np1 -i "$srcdir/../force_dynamic_llvm.patch"
}

pkgver() {
    cd "$srcdir/$provides"
    printf "0.2.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$provides"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DZIG_LIBC_LIB_DIR=$(dirname $(cc -print-file-name=crt1.o)) \
        -DZIG_LIBC_INCLUDE_DIR=$(echo -n | cc -E -x c - -v 2>&1 | grep -B1 "End of search list." | head -n1 | cut -c 2- | sed "s/ .*//") \
        -DZIG_LIBC_STATIC_LIB_DIR=$(dirname $(cc -print-file-name=crtbegin.o))
    make
}

check() {
    cd "$srcdir/$provides/build"

    # omit full compiler test since it takes ages
    ./zig version
}

package() {
    cd "$srcdir/$provides/build"
    install -Dm644 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make DESTDIR="$pkgdir" install
}
