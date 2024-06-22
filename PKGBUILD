# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202405
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
)
b2sums=('aa0c3d0b69c46a9098899fd8ef93962029309bcbd99a5a511fd079e3e0f055c1afa0ae2e988637fd13a25ee533189dcae3d12cd689d6578582d0a2707844e21c'
        'SKIP')

prepare() {
    cd "$srcdir/$pkgname"

    git submodule init
    git config submodule.src/simdjson.url "$srcdir/simdjson"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir"

    sed -i 's/-D_FORTIFY_SOURCE=1//' "$pkgname/CMakeLists.txt"

    cmake -B build -G Ninja "$pkgname" -DCMAKE_INSTALL_SBINDIR=bin
    cmake --build build
}

package() {
    cd "$srcdir"

    cmake --install build --prefix "$pkgdir/usr"
}
