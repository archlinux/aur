# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.10.0.r931.gf211c1559a
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64' 'aarch64')
url='https://ziglang.org'
license=('MIT')
depends=('clang' 'llvm' 'lld')
makedepends=('cmake' 'git')
provides=(zig)
conflicts=(zig)
source=("git+https://github.com/ziglang/zig.git")
md5sums=('SKIP')

pkgver() {
    git -C zig describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S zig \
        -DCMAKE_BUILD_TYPE=None \
        -DZIG_PREFER_CLANG_CPP_DYLIB=ON \
        -DZIG_STATIC_ZLIB=on
    cmake --build build
    cmake --install build
}

check() {
    # omit full compiler test since it takes ages
    build/stage3/bin/zig version
}

package() {
    install -Dm644 zig/LICENSE "$pkgdir/usr/share/licenses/$provides/LICENSE"
    cp -a build/stage3/. "$pkgdir/usr"
}
