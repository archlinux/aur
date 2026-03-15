# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zerobrew
pkgver=0.2.1
pkgrel=1
pkgdesc='A drop-in, 5-20x faster, experimental Homebrew alternative.'
arch=('x86_64' 'aarch64')
url='https://github.com/lucasgelfond/zerobrew'
license=('MIT' 'Apache-2.0')
optdepends=('ruby: For building bottles from source')
makedepends=('cargo' 'git')
options=(!lto)
provides=('zb' 'zbx')
conflicts=('zerobrew-git' 'zerobrew-bin')
install=zerobrew.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'zerobrew.install')
sha256sums=('47e325a8de0b104fd9ee4a12062ba60b7edd225c951b3bea047603750dd760f1'
            '9092be5274ca2a0bf7193c58fb0cc63d7328bc8eb3d390db7aae3ab70ce02b39')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 'target/release/zb' "$pkgdir/usr/bin/zb"
    install -Dm0755 'target/release/zbx' "$pkgdir/usr/bin/zbx"
    install -Dm644 LICENSE-MIT.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
