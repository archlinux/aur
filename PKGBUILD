# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=aarty-git
_pkgname=aarty
pkgver=0.8.2.r5.ge9b7c62
pkgrel=1
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
    export AARTY_BUILD_OVERWRITE_VERSION="$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 "target/release/aarty" "$pkgdir/usr/bin/aarty"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" man/aarty.1
    command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/aarty.1"
}

