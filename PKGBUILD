# Maintainer: Yuhanun Citgez <y dot citgez at student dot utwente dot nl>
# Maintainer: Hans Goor <me at eyedevelop dot org>

pkgname=verona
pkgver=5ad39dbb9f53bbd08c1e6f7c87bbad9f0a439d71
pkgrel=1
pkgdesc="Microsoft's Verona programming language interpreter and compiler"
arch=('x86_64')
url='https://github.com/microsoft/verona'
licence=('MIT')
depends=('python')
makedepends=('cmake' 'ninja' 'clang' 'llvm')
provides=('veronac' 'verona-interpreter')
source=("git+https://github.com/microsoft/verona#commit=$pkgver")
md5sums=('SKIP')

prepare() {
    cd verona
    git submodule update --init --recursive
}

build() {
    cd verona
    mkdir build_ninja
    cd build_ninja
    cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=/usr/bin/clang++
    ninja install
}

check() {
    cd verona/build_ninja
    ctest -j $(nproc)
}

package() {
    cd verona/build_ninja
    install -Dm755 dist/veronac "${pkgdir}"/usr/bin/veronac
    install -Dm755 dist/interpreter "${pkgdir}"/usr/bin/verona-interpreter
}