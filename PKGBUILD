# Maintainer: Yuhanun Citgez <y dot citgez at student dot utwente dot nl>
# Co-maintainer: Hans Goor <me at eyedevelop dot org>

pkgname=verona
pkgver=8
pkgrel=2
commit_hash=9cab6b27490fdae34cf67454549abe8c06be345a
pkgdesc="Microsoft's Verona programming language interpreter and compiler"
arch=('x86_64')
url='https://github.com/microsoft/verona'
licence=('MIT')
depends=('python')
makedepends=('python-pip' 'cmake' 'ninja' 'clang' 'llvm')
provides=('veronac' 'verona-interpreter')
source=("git+https://github.com/microsoft/verona#commit=$commit_hash")
md5sums=('SKIP')

prepare() {
    cd verona
    git submodule update --init --recursive
    python3 -m pip install OutputCheck --user
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
    mkdir -p "${pkgdir}"/opt/verona
    install -Dm755 dist/veronac "${pkgdir}"/opt/verona/veronac
    install -Dm755 dist/interpreter "${pkgdir}"/opt/verona/verona-interpreter

    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/verona/veronac "${pkgdir}"/usr/bin/veronac
    ln -s /opt/verona/verona-interpreter "${pkgdir}"/usr/bin/verona-interpreter

    cp -r ../src/stdlib "${pkgdir}"/opt/verona/stdlib
}
