# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=brum
pkgver=0.8.2
pkgrel=1
pkgdesc="Multi-Pane Web Environment (File Commander/Manager) - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/brum"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates' 'gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'rust' 'pkgconf' 'gtk3' 'webkit2gtk-4.1')
options=('!lto')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3cbe65dafd349a1c22dd7a7c6ffc778539bc63a47381a36232237398d23a0d5e')

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
    cargo build --release --features gui
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

