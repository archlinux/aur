# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs
pkgver=0.6.2
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('glibc' 'libgcc')
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
sha256sums=('d2218d1a2656607a2c0e494f47a5c03500a6dcba89855b5a86f97beea00c8fb2')

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
