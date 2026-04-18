# Maintainer: PR0M4XIMUS <pr0m4ximus at proton dot me>
# SPDX-License-Identifier: 0BSD

pkgname=sortiz-git
pkgver=r5.7b21b16
pkgrel=1
pkgdesc="TUI sorting algorithm visualizer with smooth animations and full theme support"
arch=('x86_64' 'aarch64')
url="https://github.com/PR0M4XIMUS/sortiz"
license=('MIT')
depends=('gcc-libs' 'alsa-lib')
makedepends=('cargo' 'git' 'alsa-lib')
provides=('sortiz')
conflicts=('sortiz')
# Disable debug flag injection: Arch's makepkg sets CARGO_PROFILE_RELEASE_DEBUG=2
# and DEBUG_RUSTFLAGS="-C debuginfo=2 -C force-frame-pointers=yes" which trigger
# a SIGSEGV in rustc 1.94.1 during LLVM codegen. options=(!debug) suppresses this.
options=('!debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/sortiz      "$pkgdir/usr/bin/sortiz"
    install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md                   "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.example.toml         "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}
