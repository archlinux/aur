# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=random-rs
pkgver=0.2.0
pkgrel=1
pkgdesc='Generate random numbers from CLI'
url='https://github.com/one-d-wide/random-rs'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=(GPL3)
provides=('random')
conflicts=('random')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

prepare() {
    cd "$pkgname-$pkgver"
    cat >>Cargo.toml <<EOF
[profile.release]
lto = true
opt-level = 's'
debug = false
strip = 'symbols'
EOF
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    ln -s "$pkgname" "$pkgdir/usr/bin/${provides[0]}"
}
