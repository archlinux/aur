# Author: futpib <futpib@gmail.com>

_gitname=ton
pkgname=ton-git
pkgver=rr174.db3619e
pkgrel=1
pkgdesc='The next gen network to unite all blockchains and the existing Internet'
arch=('any')
url='https://github.com/ton-blockchain/ton'
license=('GPL')
depends=()
makedepends=('git'
             'cmake'
             'gsl')
provides=('ton')
conflicts=('ton')
source=('git+https://github.com/ton-blockchain/ton.git'
        'git+https://github.com/abseil/abseil-cpp.git'
        'git+https://github.com/google/crc32c.git'
        'git+https://github.com/ton-blockchain/libRaptorQ.git'
        'git+https://github.com/facebook/rocksdb.git')
sha256sums=('SKIP'
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
    git config submodule."third-party/libraptorq".url "$srcdir/libRaptorQ"
    git config submodule."third-party/rocksdb".url "$srcdir/rocksdb"
    git submodule update

    sed -i 's/find_package(Threads REQUIRED)/\0\nfind_package(GSL REQUIRED)/' ./CMakeLists.txt
    sed -i 's/find_package(LATEX)//' ./CMakeLists.txt
    sed -i 's/#include <array>/\0\n#include <stdexcept>\n#include <limits>/' ./third-party/abseil-cpp/absl/synchronization/internal/graphcycles.cc
    sed -i 's/target_link_libraries(rldp2 PRIVATE gsl)/target_link_libraries(rldp2 PRIVATE gsl gslcblas)/' ./rldp2/CMakeLists.txt
}

build() {
    cd build

    cmake "../$_gitname" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DWITH_LIBURING=0
    make -j $(nproc)
}

package() {
    cd build

    make install
}
