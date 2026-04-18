# Maintainer: yobson <aur@yobson.xyz>
pkgname=zipsign
pkgdesc='A tool to sign and verify .zip and .tar.gz files with an ed25519 signing key'
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
url="https://crates.io/crates/${pkgname}"
license=('MIT OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception')
makedepends=('cargo')
depends=('libgcc' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Kijewski/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('909b6828e0416644cfbd2c83c83b809948b7acb38cdc3293b8d1489b7ecc661c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver/cli"

    export RUSTUP_TOOLCHAIN=stable

    # can't use --locked here because upstream doesn't publish lockfiles
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver/cli"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver/cli"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
