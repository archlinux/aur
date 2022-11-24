# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=lolcat-rs
pkgver=1.4.1
pkgrel=2
pkgdesc="The good ol' lolcat, now with fearless concurrency."
url='https://github.com/ur0/lolcat'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('custom:MIT')
provides=('lolcat')
conflicts=('lolcat')
depends=('gcc-libs')
makedepends=('cargo')
_commit_hash='9e957b72c8eb624ab46486313c122eb7b02e4426'
source=("$pkgname.tar.gz::$url/archive/$_commit_hash.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "lolcat-$_commit_hash"
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
    cd "lolcat-$_commit_hash"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "lolcat-$_commit_hash"
    install -Dm755 "target/release/lolcat" -t "$pkgdir/usr/bin"
}
