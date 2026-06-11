# Maintainer: Brian McCallister <brianm@apache.org>
pkgname=bdsh
pkgver=0.3.0
pkgrel=1
pkgdesc="Better Distributed Shell - run commands on multiple hosts with consensus view"
arch=('x86_64' 'aarch64')
url="https://github.com/brianm/bdsh"
license=('Apache-2.0')
depends=('tmux')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/brianm/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$(find target -name 'bdsh.1' -path '*/build/*/out/*' | head -1)" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
