# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: InTeaReable <leyn.the.cat@gmail.com>

pkgname=nyado
pkgver=0.2.0
pkgrel=1
pkgdesc="A Rust todo-list manager with TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/LeynTheCat/nyado"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7fd152cc8ac62cb595ef15937355e881f5d1a2bbfadce07423a65a7d5a238fc5')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo update ## FIXME: get upstream to sync Cargo.lock with Cargo.toml
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/nyado -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
