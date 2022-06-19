# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=pw-volume-git
pkgver=r45.a906b7e
pkgrel=1
pkgdesc="Basic interface to PipeWire volume controls"
arch=("x86_64")
url="https://github.com/smasher164/pw-volume"
license=('MIT')
conflicts=('pw-volume')
depends=('pipewire')
makedepends=('cargo')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
        cd $pkgname
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/pw-volume"
}
