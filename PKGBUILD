# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak-git
pkgver=0.11.0.r1.g49eef43
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/${pkgname%-git}"
license=(BSD)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
makedepends=(cargo
             git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --always --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname%-git}"
	cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname%-git}"
	cargo test --frozen --all-features
}

package () {
    cd "${pkgname%-git}"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
