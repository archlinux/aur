# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zerobrew
pkgver=0.1.1
pkgrel=1
pkgdesc='A drop-in, 5-20x faster, experimental Homebrew alternative.'
arch=('x86_64' 'aarch64')
url='https://github.com/lucasgelfond/zerobrew'
license=('MIT' 'Apache-2.0')
makedepends=('cargo' 'git')
options=(!lto)
provides=('zb' 'zbx')
conflicts=('zerobrew-git' 'zerobrew-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('dbbddff4b22a264e993ab7b254e0eb87a958a559c8438671f4eac3fd5517868b'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

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

