# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=xwayclip-git
pkgver=0.2.2.r2.g50a424a
pkgrel=1
pkgdesc='Bidirectional clipboard synchronization between X11 and Wayland for poorly implemented apps like Linux QQ'
arch=('x86_64')
url='https://github.com/so1ve/xwayclip'
license=('MIT')
makedepends=('git' 'cargo')
depends=('gcc-libs' 'glibc')
provides=("xwayclip=$pkgver")
conflicts=('xwayclip' 'xwayclip-bin')
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
    install -Dm755 target/release/xwayclip -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
