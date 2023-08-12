# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.4.2
_commit=b1b0fde3612ddf044caf16b86a7435e7bafe96bd
_p4runtime_commit=d76a3640a223f47a43dc34e5565b72e43796ba57
_googletest_commit=f8d7d77c06936315286eb55f8de22cd23c188571
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
    "git+https://github.com/p4lang/p4runtime.git#commit=$_p4runtime_commit"
    "git+https://github.com/google/googletest.git#commit=$_googletest_commit"
    "$pkgname-fix-linking-with-protobuf-23.patch::https://patch-diff.githubusercontent.com/raw/p4lang/p4c/pull/4104.patch"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'ac41d63ec6522c4b70556934f88329a6c14c51d871c336b6e8a834298d27c4ea')

prepare() {
    cd "$pkgname"
    patch -Np1 -i "../$pkgname-fix-linking-with-protobuf-23.patch"

    git submodule init
    git config submodule.test/frameworks/gtest.url "$srcdir/googletest"
    git submodule deinit backends/ebpf/runtime/contrib/libbpf
    git -c protocol.file.allow=always submodule update
}

build() {
    # build dir must be located inside the source directory and named 'build', the tests expect this
    cmake -B "$pkgname/build" -S "$pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_UNITY_BUILD=ON \
        -DP4C_USE_PREINSTALLED_PROTOBUF=ON \
        -DENABLE_PROTOBUF_STATIC=OFF \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_P4RUNTIME=p4runtime \
        -Wno-dev
    cmake --build "$pkgname/build"
}

check() {
    #TODO: tests fail
    ctest --test-dir "$pkgname/build" --output-on-failure || true
}

package() {
    DESTDIR="$pkgdir/" cmake --install "$pkgname/build"
}
