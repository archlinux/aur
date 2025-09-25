# Maintainer: i0f <i0f@posteo.net>
pkgname=tsh
pkgver=0.1.0
pkgrel=4
pkgdesc="A Rust CLI tool that fetches a random hot post from r/twosentencehorror."
arch=('x86_64')
url="https://codeberg.org/i0f/$pkgname"
license=('MIT')
depends=('glibc' 'openssl' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/i0f/tsh/archive/v$pkgver.tar.gz")
sha512sums=('61e0a409438e3034aad8fab09b3a6e773425cb9ded4085c9d12712116ae119f01d04a027623a31b3f88cb3d496026bc464125520a8bf178f02f3de6b446d7b58')

prepare() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 target/release/tsh "$pkgdir/usr/bin/tsh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
