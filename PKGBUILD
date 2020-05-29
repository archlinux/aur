# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak-git
pkgver=0.7.0.r17.g500d73f
pkgrel=3
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/${pkgname%-git}"
license=('BSD')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('cargo-nightly' 'git' 'rust-nightly' 'rustup')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --always --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    rustup toolchain list | grep -q '^nightly' ||
        rustup install --no-self-update nightly
    cargo +nightly fetch
}

build() {
    cd "${pkgname%-git}"
    cargo +nightly build --release --locked --all-features
}

check() {
    cd "${pkgname%-git}"
    cargo +nightly test --release --locked
}

package () {
    cd "${pkgname%-git}"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
