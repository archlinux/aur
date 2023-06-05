# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.4.0
_commit=71a06fee49d2237afc28b8f74c96b1d390e93c12
pkgrel=1
pkgdesc="P4 reference compiler"
arch=('any')
url="https://github.com/p4lang/p4c"
license=('Apache')
depends=(
    'boost-libs'
    'p4lang-bmv2'
    'protobuf'
    'python'
    'python-ply'
    'python-pyroute2'
    'python-scapy'
)
makedepends=(
    'boost'
    'cmake'
    'git'
    'libbpf'
    'llvm'
)
checkdepends=('clang')
source=(
    "$pkgname::git+$url.git#commit=$_commit"
    "git+https://github.com/google/googletest.git"
    "git+https://github.com/p4lang/p4runtime.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.test/frameworks/gtest.url "$srcdir/googletest"
    git config submodule.control-plane/p4runtime.url "$srcdir/p4runtime"
    git submodule deinit backends/ebpf/runtime/contrib/libbpf
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_UNITY_BUILD=ON -DPROTOBUF_LIBRARY=protobuf ..
    make
}

check() {
    cd "$pkgname/build"
    #TODO: tests fail
    make -k check
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
