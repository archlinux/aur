# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgbase=nickel
pkgname=(nickel nickel-language-server)
pkgver=1.1.1
pkgrel=1
pkgdesc='Better configuration for less'
arch=(x86_64)
url='https://nickel-lang.org/'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo)
checkdepends=(python)
provides=(nickel nls)
conflicts=(nickel nls)

source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/tweag/nickel/archive/refs/tags/1.1.1.tar.gz"
)
sha256sums=(
    '48f709d5c21c9961bfaaf7a1abc766fc62909afd249e8cd104f72d2a68df601e'
)

prepare() {
    cd "$pkgbase-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgbase-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
    CARGO_TARGET_DIR=target \
        cargo build --frozen --release --all-features --bins
}

check() {
    cd "$pkgbase-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
        cargo test --frozen --all-features
}

package_nickel() {
    cd "$pkgbase-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nickel"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_nickel-language-server() {
    cd "$pkgbase-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nls"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
