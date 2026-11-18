# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=demongrep-git
pkgver=r29.10bd814
pkgrel=1
pkgdesc="Fast, local semantic code search powered by Rust (git version)"
arch=('x86_64')
url="https://github.com/yxanul/demongrep"
license=('Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust' 'cargo' 'openssl' 'pkg-config')
# rust-lld cannot read the GCC LTO objects that cc produces for the bundled C sources
# (oniguruma, lmdb, tree-sitter), so the final link reports them as undefined symbols.
options=('!lto')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
