# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=latchshot
_pkgver=0.4.0
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='A lightweight yet intelligent window-aware screenshot tool for Wayland'
arch=('x86_64')
url='https://github.com/so1ve/latchshot'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'wl-clipboard')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('8a0aebef68bef8be2a099b00d740a8f73e940532e8375152581b97484741ba99')

prepare() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm755 target/release/latchshot -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
