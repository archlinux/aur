# Maintainer: Raimo Geisel <raimog92@protonmail.com>
pkgname=durthang
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern, terminal-based MUD client with TLS, GMCP, automap, aliases, triggers, and a sidebar panel system"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/Pommersche92/durthang"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo')
provides=('durthang')
conflicts=('durthang-bin')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('cef9f3afd704cd798e51e318c71b326c8d4fc866fe920833bff0d9f714f0998e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
