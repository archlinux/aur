# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgbase=nickel
pkgname=(nickel nickel-language-server)
pkgver=1.2.1
pkgrel=1
pkgdesc='Better configuration for less'
arch=(x86_64)
url='https://nickel-lang.org/'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo)
checkdepends=(python)

source=("$pkgbase-$pkgver.tar.gz::https://github.com/tweag/nickel/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c926dfab3077020cee306bc89078430c3a67c8f8351da5f2409c656e61d9b639')

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
    provides=(nickel)
    conflicts=(nickel)

    cd "$pkgbase-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nickel"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_nickel-language-server() {
    provides=(nls)
    conflicts=(nls)

    cd "$pkgbase-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nls"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
