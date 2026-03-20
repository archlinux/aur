# Author: futpib <futpib@gmail.com>

_gitname=ton
pkgname=ton-git
pkgver=rr2010.a31025f3
pkgrel=1
pkgdesc='The next gen network to unite all blockchains and the existing Internet'
arch=('x86_64')
url='https://github.com/ton-blockchain/ton'
license=('GPL')
depends=('gcc-libs' 'libsecp256k1' 'readline')
makedepends=('git'
             'cmake'
             'pkgconf'
             'autoconf'
             'automake'
             'libtool')
provides=('ton')
conflicts=('ton')
source=('git+https://github.com/ton-blockchain/ton.git'
        'git+https://github.com/abseil/abseil-cpp.git'
        'git+https://github.com/google/crc32c.git'
        'git+https://github.com/facebook/rocksdb.git'
        'git+https://github.com/supranational/blst.git'
        'git+https://github.com/ton-blockchain/tl-parser.git'
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        'git+https://github.com/ton-blockchain/libmicrohttpd.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "rr%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build

    cd "$_gitname"

    git submodule init
    git config submodule."third-party/crc32c".url "$srcdir/crc32c"
    git config submodule."third-party/abseil-cpp".url "$srcdir/abseil-cpp"
    git config submodule."third-party/rocksdb".url "$srcdir/rocksdb"
    git config submodule."third-party/blst".url "$srcdir/blst"
    git config submodule."third-party/tl-parser".url "$srcdir/tl-parser"
    git config submodule."third-party/libbacktrace".url "$srcdir/libbacktrace"
    git config submodule."third-party/libmicrohttpd".url "$srcdir/libmicrohttpd"
    git -c protocol.file.allow=always submodule update

    sed -i 's/find_package(LATEX)//' ./CMakeLists.txt
}

build() {
    cd build

    cmake "../$_gitname" \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_LIBURING=0 \
        -DUSE_QUIC=OFF
    make -j $(nproc)
}

package() {
    cd build

    make install
}
