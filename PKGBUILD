# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
_pkgname=danmu2ass
pkgname=$_pkgname-git
pkgver=0.2.2.r10.b7b6435
pkgrel=1
pkgdesc='Convert danmuku of Bilibili to ass subtitle file'
url='https://github.com/gwy15/danmu2ass'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
    cd "$_pkgname"

    printf '%s' "$(git describe --long --tags | sed 's/^v//; s/\([^-]*-\)g/r\1/; s/-/./g')"
}

prepare() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"

    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
