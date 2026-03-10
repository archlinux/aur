# Maintainer: iSorensen
pkgname=hyprflow
pkgver=0.2.0
pkgrel=1
pkgdesc="Save and restore Hyprland window sessions"
arch=('x86_64')
url="https://github.com/isorensen/hyprflow"
license=('MIT')
depends=('hyprland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7e80c96f255fa378f483eea3f166499e690f0f7b74453e61036c5f62357fff4f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
