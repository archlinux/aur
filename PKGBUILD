# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar
_pkgname=guitar
pkgver=1.0.4
pkgrel=1
pkgdesc='A terminal based git client with fast topological & chronological graph rendering'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0-or-later')
depends=('git')
makedepends=('cargo')
options=(
    !lto
    !debug
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
provides=(guitar)
conflicts=('git-guitar-git' 'git-guitar-bin')
sha256sums=('1a9dc9f5f8b7a80602059133a31f483e6910fdfa9b2cbc161dccc58cab9af83b')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/guitar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

