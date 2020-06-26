# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.6.0.r813.g130c7fd23
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='https://ziglang.org'
license=('MIT')
depends=('clang' 'llvm>=10' 'lld')
makedepends=('cmake' 'git')
provides=(zig)
conflicts=(zig)
source=("git+https://github.com/zig-lang/zig.git")
md5sums=('SKIP')

pkgver() {
    git -C zig describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p build
    cd build
    cmake ../zig -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DZIG_PREFER_CLANG_CPP_DYLIB=ON
    make DESTDIR=.
}

check() {
    # omit full compiler test since it takes ages
    build/zig version
}

package() {
    install -Dm644 zig/LICENSE "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make -C build DESTDIR="$pkgdir" install
}
