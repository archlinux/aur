# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=random-rs
pkgver=0.1.0
pkgrel=4
pkgdesc='Simple CLI multitool'
url='https://github.com/one-d-wide/random-rs'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=(GPL3)
provides=('random')
conflicts=('random')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fda45b9efab1c4eb27ef504ac42c9e45294177c9c12c28c83c4cfb31534c151e')

prepare() {
    cd "$pkgname-$pkgver"
    >Cargo.config
    if [[ "$(pacman -Qq rust)" == rust ]]; then
        echo Package rust installed: compile with dynamic linking
        echo -e '[build]\nrustflags = ["-C", "prefer-dynamic=yes"]' >Cargo.config
    fi
    cat >>Cargo.toml <<EOF
[profile.release]
opt-level = 's'
debug = false
incremental = false
strip = 'symbols'
EOF
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --config Cargo.config
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    ln -s "$pkgname" "$pkgdir/usr/bin/${provides[0]}"
}
