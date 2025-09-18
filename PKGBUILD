# Maintainer: Thijzert123 <184778919+Thijzert123@users.noreply.github.com>

pkgname=packrinth
pkgver=0.7.3
pkgrel=3
pkgdesc="CLI tool for creating and maintaining your own Minecraft modpack."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://thijzert123.github.io/packrinth"
license=('MIT')
makedepends=(cargo)
depends=(gcc-libs)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4dee86d4c9056b4b358cf61cb975650995ed11f9a728b7fa3b97eed77d26d25f')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "site" "${pkgdir}/usr/share/doc/${pkgname}/site"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
