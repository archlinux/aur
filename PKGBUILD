# Maintainer: i0f <i0f@posteo.net>
pkgname=tsh
pkgver=0.1.1
pkgrel=1
pkgdesc="A Rust CLI tool that fetches a random hot post from r/twosentencehorror."
arch=('x86_64')
url="https://codeberg.org/i0f/$pkgname"
license=('MIT')
depends=('glibc' 'openssl' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/i0f/tsh/archive/v$pkgver.tar.gz")
sha512sums=('adc6b9128b5599263bedc95e43c885240c5bfb1a7ce1394808d074e060b4cf6b1c51dac7aaf25387cec9fdf05d725e6d99e49850ff0a20f02b3a921e6a5bc24f')
options=(!lto) # The package doesn't build without disabling lto. No idea why...

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
