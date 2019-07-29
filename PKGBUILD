# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.4.0.r938.gc47b75312
pkgrel=1
pkgdesc="a programming language prioritizing robustness, optimality, and clarity"
arch=('i686' 'x86_64')
url='http://ziglang.org'
license=('MIT')
depends=('clang' 'llvm')
makedepends=('cmake' 'git')
provides=(zig)
conflicts=(zig)
source=("git://github.com/zig-lang/zig.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$provides"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$provides"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
    make DESTDIR=.
}

check() {
    cd "$srcdir/$provides/build"

    # omit full compiler test since it takes ages
    ./zig version
}

package() {
    cd "$srcdir/$provides/build"
    install -Dm644 "$srcdir/$provides/LICENSE" "$pkgdir/usr/share/licenses/$provides/LICENSE"
    make DESTDIR="$pkgdir" install
}
