# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty-git
_pkgname=aarty
pkgver=0.7.1.r8.g276d1c3
pkgrel=2
pkgdesc='Simple CLI tool to convert the images to ASCII art - Build from the aurora branch'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/0x61nas/aarty'
license=('MIT')
makedepends=('cargo')
provides=('aarty')
conflicts=('aarty')
source=("$_pkgname::git+$url.git#branch=aurora")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 "target/release/aarty" "$pkgdir/usr/bin/aarty"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

