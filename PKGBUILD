# Maintainer: yobson <aur@yobson.xyz>
pkgname=zipsign
pkgdesc='A tool to sign and verify .zip and .tar.gz files with an ed25519 signing key'
pkgver=0.2.2
pkgrel=1
arch=('x86_64')
url="https://crates.io/crates/${pkgname}"
license=('MIT OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception')
makedepends=('cargo')
depends=('libgcc' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('de8b0a0ec4d91bf8a14574b8aac050ddf6204ae8fa573c90f2bd47c9f8113925')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
