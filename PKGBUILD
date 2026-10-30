# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=brum
pkgver=1.12.4
pkgrel=1
pkgdesc="Multi-Pane Web Environment (File Commander/Manager) - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/brum"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
makedepends=('cargo' 'rust' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f9c092cb80f4b0b6494879fde286315fca490ee4b53602e1fd77a9e0590d5b4')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export RUSTFLAGS="-C link-arg=-Wl,--no-as-needed"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/brum" "$pkgdir/usr/bin/brum"
    install -Dm644 "brum.service" "$pkgdir/usr/lib/systemd/system/brum.service"
    install -Dm644 "brum.desktop" "$pkgdir/usr/share/applications/brum.desktop"
    
    install -Dm644 "config.toml" "$pkgdir/etc/brum/config.toml"
    
    install -Dm644 "assets/128/brum-128.webp" "$pkgdir/usr/share/pixmaps/brum.webp"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

