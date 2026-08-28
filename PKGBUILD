# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog
pkgver=0.3.1
pkgrel=1
pkgdesc="Multi-Tab Web & Desktop File Commander - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates')
makedepends=('cargo' 'rust' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c3ddda7d275281b314b43d4e02007ad8ca08a8b5dce07a13e76ffc598f5b6fe')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
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
