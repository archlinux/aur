# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=1.2.0
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players"
arch=("x86_64")
url="https://github.com/lazykern/mprisence"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
conflicts=("mprisence-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

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
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

note() {
    cat <<EOF
==> Example configuration is available at /etc/mprisence/config.example.toml
==> To configure mprisence:
    1. Create your config directory:
       mkdir -p ~/.config/mprisence
    2. Copy and modify the example config:
       cp /etc/mprisence/config.example.toml ~/.config/mprisence/config.toml
    3. Enable and start the service:
       systemctl --user enable --now mprisence
EOF
} 