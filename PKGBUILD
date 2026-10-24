# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=amorphis
pkgver=0.1.0
pkgrel=1
pkgdesc="Small fail-closed screen locker for Wayland and X11"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/amorphis"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pam')
makedepends=('cargo' 'pkgconf')
backup=('etc/pam.d/amorphis')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'amorphis.pam')
sha256sums=('f4e74759840855a0e79cad9f7fa2cd100b611ccf7f300cb8a90a3e3b18f01278'
            'b23a0ff8022f51f692b498fb3c78d467ea6575e0ccf9d42fc4172ff539116a9a')

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/amorphis "$pkgdir/usr/bin/amorphis"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/amorphis.pam" "$pkgdir/etc/pam.d/amorphis"
}
