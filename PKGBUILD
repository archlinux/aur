# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=1.2.13
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
conflicts=("mprisence-git")
install=mprisence.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        "mprisence.install"
        "mprisence.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    install -Dm755 "target/release/mprisence" "$pkgdir/usr/bin/mprisence"
    install -dm755 "$pkgdir/etc/mprisence"
    install -Dm644 "config/config.example.toml" "$pkgdir/etc/mprisence/config.example.toml"
    install -Dm644 "../mprisence.service" "$pkgdir/usr/lib/systemd/user/mprisence.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
