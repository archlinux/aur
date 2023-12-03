# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164
_pkgname=mpv-danmaku
pkgname=$_pkgname-git
pkgver=0.1.0.r7.5721aa1
pkgrel=1
pkgdesc='MPV plugin that loads bilibili comments automaticaly'
url='https://github.com/skbeh/mpv-danmaku'
arch=('x86_64')
license=('GPL3')
depends=(
    'mpv'
    'danmu2ass-git' # 'danmu2ass' is dead
)
makedepends=('cargo' 'clang' 'llvm' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
    cd "$_pkgname"

    printf '%s' "$(git describe --long --tags | sed 's/^v//; s/\([^-]*-\)g/r\1/; s/-/./g')"
}

prepare() {
    cd "$_pkgname"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
    cargo test --frozen
}

package() {
    cd "$_pkgname"

    install -Dm755 'target/release/libmpv_danmaku.so' "$pkgdir/usr/lib/$_pkgname/danmaku.so"
    install -dm755 "$pkgdir/etc/mpv/scripts/"
    ln -s "/usr/lib/$_pkgname/danmaku.so" "$pkgdir/etc/mpv/scripts/"
}
