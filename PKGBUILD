# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=xwayclip-git
pkgver=v0.2.2.r0.g548cfbc
pkgrel=1
pkgdesc='Bidirectional clipboard synchronization between X11 and Wayland for poorly implemented apps like Linux QQ'
arch=('x86_64')
url='https://github.com/so1ve/xwayclip'
license=('MIT')
makedepends=('git' 'cargo')
provides=('xwayclip')
conflicts=('xwayclip')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/xwayclip -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
