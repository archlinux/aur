# Maintainer: Marc Tiehuis <marctiehuis at gmail.com>

pkgname=zig-git
pkgver=0.10.0.r1928.g3169f0529b
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
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DZIG_SHARED_LLVM=ON
    cmake --build build
}

# No `check()` because zig currently doesn't have a test target. See:
# https://github.com/ziglang/zig/issues/14240
# NOTE: In the future, a check step will be provided, but will likely be slow. Use `makepkg --nocheck` to skip it.

package() {
    install -Dm644 zig/LICENSE "$pkgdir/usr/share/licenses/$provides/LICENSE"
    DESTDIR="$pkgdir" cmake --install build
}
