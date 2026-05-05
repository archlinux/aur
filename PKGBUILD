# Maintainer: Silvio Di Stefano <sdistefano@gmail.com>
pkgname=wiim-tui-git
_pkgname=wiim-tui
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Keyboard-driven terminal UI for WiiM (LinkPlay) audio streamers"
arch=('x86_64')
url="https://github.com/sdistefano/wiim-tui"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+https://github.com/sdistefano/wiim-tui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local ver
    ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
    printf "%s.r%s.g%s" "$ver" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
