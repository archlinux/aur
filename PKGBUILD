# Maintainer: tony <tonycth@proton.me>

pkgname=arcfetch
pkgver=0.7.0
pkgrel=1
pkgdesc="Blazing-fast Arch Linux sysinfo "
arch=('x86_64' 'aarch64')
url="https://github.com/tonycth7/arcfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('arcfetch')
conflicts=('arcfetch')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    cargo test --frozen 2>/dev/null || true
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
