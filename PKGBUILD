# Maintainer: Bolt J Woofson <bolt@boop.no>
pkgname=commanderdog
pkgver=0.3.3
pkgrel=1
pkgdesc="Multi-Tab Web & Desktop File Commander - By Woofson"
arch=('x86_64' 'aarch64')
url="https://github.com/Woofson/commanderdog"
license=('MIT')
depends=('glibc' 'sqlite' 'libssh2' 'openssl' 'ca-certificates' 'gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'rust' 'pkgconf' 'gtk3' 'webkit2gtk-4.1')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('efe0c1c95e46aa4e7a31fad4bdc4acda5a3751581b9abddf8821e5ecc3c92d8d')

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
    cargo build --release --frozen --features gui,pam
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
