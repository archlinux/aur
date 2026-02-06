# Maintainer: jswysnemc <jswysnemc@gmail.com>
pkgname=mtrans-git
pkgver=v0.1.1.r0.ga236af1
pkgrel=1
pkgdesc="A CLI tool for translation using LLM API"
arch=('x86_64')
url="https://github.com/jswysnemc/mtrans"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
provides=("mtrans")
conflicts=("mtrans")
source=("git+https://github.com/jswysnemc/mtrans.git")
sha256sums=('SKIP')

pkgver() {
    cd "mtrans"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "mtrans"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

options=(!lto)

build() {
    cd "mtrans"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # unset build flags that might break ring/rust linking
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --frozen --release --all-features
}

package() {
    cd "mtrans"
    install -Dm755 "target/release/mtrans" "$pkgdir/usr/bin/mtrans"
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
