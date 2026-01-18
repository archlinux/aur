# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar
_pkgname=guitar
pkgver=0.1.39
pkgrel=2
pkgdesc='A terminal based git client with fast topological & chronological graph rendering'
arch=(x86_64 aarch64)
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0')
depends=(git)
makedepends=(cargo)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$_pkgname-$pkgver.tar.gz.asc")
provides=(guitar)
sha256sums=('0ed37cab8862559bde9a69349c29f4204350c9ff3d7fb3b0566c291be6f882d3'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # fix the naitive linking errors 
    export RUSTFLAGS="-Clinker-plugin-lto"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

