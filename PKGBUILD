# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=zlang-git
pkgver=r521.g2307bc5
pkgrel=1
pkgdesc="ZLang programming language compiler with LLVM backend"
arch=('x86_64' 'aarch64')
url="https://github.com/zlangdevs/zlang"
license=('GPL-3.0-only')
provides=('zlang')
conflicts=('zlang')
depends=('llvm-libs')
makedepends=('git' 'zig>=0.16.0' 'flex' 'bison' 'llvm')
optdepends=('lld: LLVM linker')
source=("$pkgname::git+https://github.com/zlangdevs/zlang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    zig build -Doptimize=ReleaseFast
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "zig-out/bin/zlang" "$pkgdir/usr/lib/zlang/zlang"
    cp -r stdlib "$pkgdir/usr/lib/zlang/stdlib"
    install -d "$pkgdir/usr/bin"
    ln -sfn /usr/lib/zlang/zlang "$pkgdir/usr/bin/zlang"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
