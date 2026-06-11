# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs
pkgver=0.5.17
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('openring')
conflicts=('openring' 'openring-rs-bin')
# !lto: Arch enables LTO by default in makepkg.conf; it breaks the link of
#   *-sys crates that ship pre-compiled C/asm objects (here: aws-lc-sys, pulled
#   transitively via reqwest -> rustls -> aws-lc-rs).
# !debug: cargo --release already strips; the auto-generated -debug
#   subpackage is noise for AUR distribution.
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukehsiao/openring-rs/archive/v$pkgver.tar.gz")
sha256sums=('f729e0c1fe47c8032bb11e39f6f83d44986de4d1c4e88b9cb5ccaf2f94f0d27f')

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/openring "$pkgdir/usr/bin/openring"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
