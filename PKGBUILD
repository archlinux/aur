# Maintainer: Romain Bertrand <romain@doxin.net>
pkgname=terminalist
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal-based Todoist client with modern TUI interface"
arch=('x86_64')
url="https://github.com/romaintb/terminalist"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/romaintb/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a1c3afb03d36db05e961dc47a8e2a493d55cdd765e9a3810659aa14a5eef8aae')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLX_OFFLINE=true
    # Use system sqlite
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
    cargo build --release --all-features
}

# Tests disabled due to SQLx runtime requirements
# check() {
#     cd "$pkgname-$pkgver"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}