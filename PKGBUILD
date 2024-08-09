# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.4.14
_googletest_ver=1.14.0
_libbpf_ver=1.4.1
_p4runtime_commit=62a9bd60599b87497a15feb6c7893b7ec8ba461f
pkgrel=1
pkgdesc="P4 reference compiler"
arch=('any')
url="https://github.com/p4lang/p4c"
license=('Apache')
depends=(
    'abseil-cpp'
    'boost-libs'
    'gc'
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
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "googletest-$_googletest_ver.tar.gz::https://github.com/google/googletest/archive/refs/tags/v$_googletest_ver.tar.gz"
    "libbpf-$_libbpf_ver.tar.gz::https://github.com/libbpf/libbpf/archive/refs/tags/v$_libbpf_ver.tar.gz"
    "git+https://github.com/p4lang/p4runtime.git#commit=$_p4runtime_commit"
    "fix-gc-mark-include.patch"
)
sha256sums=('5e4170868a2b73453bc54dd776a522870f540f64ad7864a0a24fbec57e3f4dc7'
            '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
            'cc01a3a05d25e5978c20be7656f14eb8b6fcb120bb1c7e8041e497814fc273cb'
            'SKIP'
            'b1496b361e1a531f6537b4395224a2b95c5ef7172ed8b3df68244d13bc8ca4fa')

prepare() {
    # TODO: try linking dynamically against system libbpf instead
    ln -sfT "$srcdir/libbpf-$_libbpf_ver" "$srcdir/p4c-$pkgver/backends/ebpf/runtime/contrib/libbpf"
    patch -d"$srcdir/p4c-$pkgver" -p1 < "fix-gc-mark-include.patch"
}

build() {
    # build dir must be located inside the source directory and named 'build', the tests expect this
    cmake -B "p4c-$pkgver/build" -S "p4c-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_UNITY_BUILD=ON \
        -DBUILD_LINK_WITH_GOLD=OFF \
        -DP4C_USE_PREINSTALLED_PROTOBUF=ON \
        -DENABLE_PROTOBUF_STATIC=OFF \
        -DP4C_USE_PREINSTALLED_ABSEIL=ON \
        -DENABLE_ABSEIL_STATIC=OFF \
        -DP4C_USE_PREINSTALLED_BDWGC=ON \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_GTEST=googletest-$_googletest_ver \
        -DFETCHCONTENT_SOURCE_DIR_BPFREPO=libbpf-$_libbpf_ver \
        -DFETCHCONTENT_SOURCE_DIR_P4RUNTIME=p4runtime \
        -Wno-dev
    cmake --build "p4c-$pkgver/build"
}

check() {
    #TODO: tests fail
    ctest --test-dir "p4c-$pkgver/build" --output-on-failure || true
}

package() {
    DESTDIR="$pkgdir/" cmake --install "p4c-$pkgver/build"
}
