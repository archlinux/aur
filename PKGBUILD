# Author: futpib <futpib@gmail.com>

_gitname=ton
pkgname=ton-git
pkgver=r205.9875f02
pkgrel=2
pkgdesc='The next gen network to unite all blockchains and the existing Internet'
arch=('any')
url='https://github.com/newton-blockchain/ton'
license=('GPL')
depends=()
makedepends=('git')
provides=('ton')
conflicts=('ton')
source=('git://github.com/newton-blockchain/ton.git'
        'git://github.com/abseil/abseil-cpp.git'
        'git://github.com/google/crc32c.git'
        'git://github.com/ton-blockchain/libRaptorQ.git'
        'git://github.com/facebook/rocksdb.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build

    cd "$_gitname"

    git submodule init
    git config submodule."third-party/crc32c".url "$srcdir/crc32c"
    git config submodule."third-party/abseil-cpp".url "$srcdir/abseil-cpp"
    git config submodule."third-party/libraptorq".url "$srcdir/libRaptorQ"
    git config submodule."third-party/rocksdb".url "$srcdir/rocksdb"
    git submodule update

    sed -i 's/find_package(Threads REQUIRED)/\0\nfind_package(GSL REQUIRED)/' ./CMakeLists.txt
    sed -i 's/find_package(LATEX)//' ./CMakeLists.txt
    sed -i 's/#include <array>/\0\n#include <stdexcept>\n#include <limits>/' ./third-party/abseil-cpp/absl/synchronization/internal/graphcycles.cc
}

build() {
    cd build

    cmake "../$_gitname" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release
    make -j $(nproc)
}

package() {
    cd build

    make install
}
