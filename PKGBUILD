# Maintainer: Choi Madeleine gankiann.niu@gmail.com

pkgname=discord-mpris-rs
pkgver=0.2.0
pkgrel=1
pkgdesc='Discord Rich Presence for MPRIS media players'
license=('0BSD')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "$pkgname.service")
sha256sums=('efc4a0edb018d5f8b4a410602297156ba8ebaefe6437f076bd3f04156e2b8865'
            '5fd5b275586d995d3de3627009eb958b19fd8ce13ec39d7a04b9b948f9befc5b')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 .env "$pkgdir/usr/share/$pkgname/.env"
    install -Dm644 ../discord-mpris-rs.service "$pkgdir/usr/lib/systemd/user/discord-mpris-rs.service"
}
