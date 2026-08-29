# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog
pkgver=0.5.5
pkgrel=2
pkgdesc="Multi-Tab Web & Desktop File Commander - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates' 'gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'rust' 'pkgconf' 'gtk3' 'webkit2gtk-4.1')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90bfac79d9578dd70a72a96a2f17dc058ccae5b0bed8954f010cabef68f41f8e')

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
    install -Dm755 "target/release/commanderdog" "$pkgdir/usr/bin/commanderdog"
    install -Dm644 "commanderdog.service" "$pkgdir/usr/lib/systemd/system/commanderdog.service"
    install -Dm644 "commanderdog.desktop" "$pkgdir/usr/share/applications/commanderdog.desktop"
    
    install -Dm644 "config.toml" "$pkgdir/etc/commanderdog/config.toml"
    
    install -Dm644 "assets/commanderdog.png" "$pkgdir/usr/share/pixmaps/commanderdog.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
