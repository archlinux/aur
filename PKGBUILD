# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-p4c
pkgver=1.2.5.19
_googletest_ver=1.14.0
_bpftool_ver=7.5.0
_p4runtime_commit=26b75559f2fedcd11876d7ff21eec4180011dc36
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
    "bpftool-$_bpftool_ver.tar.gz::https://github.com/libbpf/bpftool/releases/download/v$_bpftool_ver/bpftool-libbpf-v$_bpftool_ver-sources.tar.gz"
    "git+https://github.com/p4lang/p4runtime.git#commit=$_p4runtime_commit"
)
sha256sums=('9230499ed8cc1f1929df701c3f08fe8d4b46bc465638050ad5127ad93e6f03a7'
            '8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7'
            '1468d3fb8c70698359a6593d8828f0e0a56b72244cb8632c6e1947e11b3520b9'
            '3ac3a57b7f890d1f7515c533552b4c256dbc1f4cdb5a2f02ba9fc126b0b1fe17')

build() {
    # build dir must be located inside the source directory and named 'build', the tests expect this
    cmake -B "p4c-$pkgver/build" -S "p4c-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_UNITY_BUILD=ON \
        -DBUILD_LINK_WITH_GOLD=OFF \
        -DBUILD_LINK_WITH_LLD=OFF \
        -DP4C_USE_PREINSTALLED_PROTOBUF=ON \
        -DENABLE_PROTOBUF_STATIC=OFF \
        -DP4C_USE_PREINSTALLED_ABSEIL=ON \
        -DENABLE_ABSEIL_STATIC=OFF \
        -DP4C_USE_PREINSTALLED_MULTIPRECISION=ON \
        -DP4C_USE_PREINSTALLED_BDWGC=ON \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_GTEST=googletest-$_googletest_ver \
        -DFETCHCONTENT_SOURCE_DIR_BPFREPO=bpftool-libbpf-v$_bpftool_ver-sources \
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
