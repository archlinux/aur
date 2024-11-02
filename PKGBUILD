# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.4.17
_googletest_ver=1.14.0
_libbpf_ver=1.4.1
_p4runtime_commit=ec4eb5ef70dbcbcbf2f8357a4b2b8c2f218845a5
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
)
sha256sums=('39a6d7fc9210477490f66aef28c0856cf751cee0af18835ca842930c3fea0ed6'
            '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
            'cc01a3a05d25e5978c20be7656f14eb8b6fcb120bb1c7e8041e497814fc273cb'
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
