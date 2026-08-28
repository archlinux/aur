# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog
pkgver=0.3.0
pkgrel=2
pkgdesc="Multi-Tab Web & Desktop File Commander - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('573431f1f894b2f5208173a46788345db1ca75cc4a71d8fac6ed96a6934979a2')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=-Wl,--no-as-needed"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/commanderdog" "$pkgdir/usr/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    install -Dm644 "commanderdog.desktop" "$pkgdir/usr/share/applications/commanderdog.desktop"
    
    install -d "$pkgdir/etc/commanderdog/conf.d"
    install -m644 conf.d/*.toml "$pkgdir/etc/commanderdog/conf.d/"
    
    install -Dm644 "assets/commanderdog.png" "$pkgdir/usr/share/pixmaps/commanderdog.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
