# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.0.0r1474.6aa04c4
pkgrel=3
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='http://ziglang.org'
license=('MIT')
depends=('llvm' 'clang' 'lld')
makedepends=('cmake' 'curl')
provides=(zig)
conflicts=(zig)
# We pin this commit since it is the last supported by llvm-4 before the switch
# to llvm-5.
source=("git://github.com/zig-lang/zig.git#commit=6aa04c422bae89c50e1289e1ca51cd4d414debb7")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$provides"
    # This patch is required due to how LLVM inlines and it not always working.
    curl https://gist.githubusercontent.com/tiehuis/294797c898892a2612e9e3246574defc/raw/42f02982c8371b710e24d9246711b3a505c35c57/remove_inline.patch > remove_inline.patch
    git apply remove_inline.patch
}

pkgver() {
    cd "$srcdir/$provides"
    printf "0.0.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    # We rebuild and install into a new local directory so we can test the
    # stdlib before installing. The `--zig-std-dir` option does not work as
    # expected with the `build` command right now so, hence the workaround.
    cd "$srcdir/$provides"
    mkdir -p build_test
    cd build_test
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$(pwd) \
        -DZIG_LIBC_LIB_DIR=$(dirname $(cc -print-file-name=crt1.o)) \
        -DZIG_LIBC_INCLUDE_DIR=$(echo -n | cc -E -x c - -v 2>&1 | grep -B1 "End of search list." | head -n1 | cut -c 2- | sed "s/ .*//") \
        -DZIG_LIBC_STATIC_LIB_DIR=$(dirname $(cc -print-file-name=crtbegin.o))
    make install

    cd "$srcdir/$provides/build_test"
    ./zig build --build-file ../build.zig test
}

package() {
    cd "$srcdir/$provides/build"
    install -Dm644 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make DESTDIR="$pkgdir" install
}
