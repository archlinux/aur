# Maintainer: Nikita Ivanov <nikita dot vyach dot ivanov at gmail dot com>
_name=river-luatile
pkgname="${_name}-git"
pkgver=r28.f6bb35c
pkgrel=1
pkgdesc="Write your own river layout generator in lua"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/MaxVerevkin/river-luatile"
license=('GPL3')
provides=("$_name")
depends=('luajit' 'libxkbcommon' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_name"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_name"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_name"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_name"
}
