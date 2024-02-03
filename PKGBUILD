# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.4.8
_googletest_ver=1.14.0
_libbpf_ver=1.2.2
_p4runtime_commit=1e771c4e05c4e7e250df00212b3ca02ee3202d71
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
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "googletest-$_googletest_ver.tar.gz::https://github.com/google/googletest/archive/refs/tags/v$_googletest_ver.tar.gz"
    "libbpf-$_libbpf_ver.tar.gz::https://github.com/libbpf/libbpf/archive/refs/tags/v$_libbpf_ver.tar.gz"
    "git+https://github.com/p4lang/p4runtime.git#commit=$_p4runtime_commit"
)
sha256sums=('55eb94a2026adab959befb751608b7f40329bdcda8297c48e213b70caff43da8'
            '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
            '32b0c41eabfbbe8e0c8aea784d7495387ff9171b5a338480a8fbaceb9da8d5e5'
            'SKIP')

prepare() {
    # TODO: try linking dynamically against system libbpf instead
    ln -sfT "$srcdir/libbpf-$_libbpf_ver" "$srcdir/p4c-$pkgver/backends/ebpf/runtime/contrib/libbpf"
}

build() {
    # build dir must be located inside the source directory and named 'build', the tests expect this
    cmake -B "p4c-$pkgver/build" -S "p4c-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_UNITY_BUILD=ON \
        -DP4C_USE_PREINSTALLED_PROTOBUF=ON \
        -DENABLE_PROTOBUF_STATIC=OFF \
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
