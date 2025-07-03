# Maintainer: Choi Madeleine gankiann.niu@gmail.com

pkgname=discord-mpris-rs
pkgver=0.2.4
pkgrel=1
pkgdesc='Discord Rich Presence for MPRIS media players'
license=('0BSD')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "$pkgname.service")
sha256sums=('de2f1f5d38600c4e3dfdfa1ecc17c347c4a1aaedef9fc401e6bd0afe9ed059ea'
            'e252382eddb4f306557e73f6324b97dd893c1965ee549d88e64cb127c4f7edb4')

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
