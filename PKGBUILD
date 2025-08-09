# Maintainer: xotkot
pkgname=refold-git
pkgver=r16.8b1561e
pkgrel=1
pkgdesc="A command-line utility for wrapping text"
arch=('x86_64' 'aarch64')
url="https://github.com/wr7/refold"
license=('GPL-2.0-or-later')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url")
b2sums=('SKIP')
provides=('refold')
conflicts=('refold')

prepare() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"

	install -Dm0755 target/release/${pkgname/-git/} "$pkgdir/usr/bin/${pkgname/-git/}"
}
