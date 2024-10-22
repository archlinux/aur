# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202409
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/intel/pcm"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('bash' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'ninja')
source=(
    "$pkgname::git+$url#tag=$pkgver"
    "simdjson::git+https://github.com/simdjson/simdjson.git"
    "perfmon::git+https://github.com/intel/perfmon.git"
)
b2sums=('3da732646dc8bfb8f5da1212f43491d36227229febe32a58448984675d988c5274c3275aa94aec1a1f8e09052bd5c69a9bea2116a63be53d530fee5f3096e008'
        'SKIP'
        'SKIP')

prepare() {
    cd "$srcdir/$pkgname"

    git submodule init
    git config submodule.src/simdjson.url "$srcdir/simdjson"
    git config submodule.perfmon.url "$srcdir/perfmon"
    git -c protocol.file.allow=always submodule update

    sed -i \
        -e 's/-D_FORTIFY_SOURCE=.//' \
        -e '/set(LINUX_SYSTEMD_UNITDIR/c set(LINUX_SYSTEMD_UNITDIR "${CMAKE_INSTALL_LIBDIR}/systemd/system")' \
        "CMakeLists.txt"
}

build() {
    cd "$srcdir"

    cmake -B build -G Ninja "$pkgname" \
        -DCMAKE_INSTALL_SBINDIR=bin \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPCM_NO_ASAN=ON \
        -DLINUX_SYSTEMD=ON
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
}
