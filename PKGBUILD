# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=latchshot-git
pkgver=0.2.5.r3.gd0eb21b
pkgrel=1
pkgdesc='A lightweight yet intelligent window-aware screenshot tool for Wayland'
arch=('x86_64')
url='https://github.com/so1ve/latchshot'
license=('MIT')
makedepends=('git' 'cargo')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'wl-clipboard')
provides=("latchshot=$pkgver")
conflicts=('latchshot' 'latchshot-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

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
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/latchshot -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
