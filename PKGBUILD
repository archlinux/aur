# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202311
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/intel/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('bash' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'ninja')
source=(
    "$pkgname::git+$url#tag=$pkgver"
    "simdjson::git+https://github.com/simdjson/simdjson.git"
)
b2sums=('SKIP' 'SKIP')

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
