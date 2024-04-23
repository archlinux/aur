# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname="aoc-cli-git"
pkgver="r111.8192ad5"
pkgrel=1
pkgdesc="Advent of Code command-line tool"
arch=('any')
url="https://github.com/scarvalhojr/${pkgname%-git}"
license=('MIT')
depends=('gcc-libs' 'openssl' 'glibc')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver(){
        cd "$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
        cd "$pkgname"
        export RUSTUP_TOOLCHAIN=stable
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
        cd "$pkgname"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --frozen --release --all-features
}

check(){
        cd "$pkgname"
        export RUSTUP_TOOLCHAIN=stable
        cargo test --frozen --all-features
}

package(){
        cd "$pkgname"
        install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-cli-git}"
}
