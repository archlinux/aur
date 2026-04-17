# Maintainer: yobson <aur@yobson.xyz>
pkgname=zipsign
pkgdesc='A tool to sign and verify .zip and .tar.gz files with an ed25519 signing key'
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url="https://crates.io/crates/${pkgname}"
license=('MIT OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception')
makedepends=('cargo')
depends=('libgcc' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Kijewski/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('392e1d264829b19c51cb6606946125b05fef489ff17738f8f3826536f76d3876')

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
