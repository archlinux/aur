# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=google-calendar-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="Read-only terminal agenda for Google Calendar via GNOME Online Accounts"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/google-calendar-tui"
license=('MIT')
depends=('gcc-libs' 'dbus' 'gnome-online-accounts')
makedepends=('cargo' 'git' 'nasm')
# LTO is disabled because ring's C/asm objects (used by reqwest's rustls
# backend) don't ship LTO bitcode and Arch's default `-flto=auto` in CFLAGS
# can trigger undefined-symbol link errors on x86_64.
# !debug because Cargo.toml's release profile does not need an auto-generated
# debug split for this small TUI, and it avoids conflicts with the -bin package.
options=('!lto' '!debug')
conflicts=('google-calendar-tui-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb38c7adda578ca39585508c706c64d44e525f1bf408299baa7ba2ac8a6965ad')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/"                 "target/release/google-calendar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/"  "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
