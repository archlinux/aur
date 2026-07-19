# Maintainer: CallMeAlphabet
pkgname=fastcp
pkgver=r1
pkgrel=1
pkgdesc="fastcp, a fast cp wrapper using --reflink=always, builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcp"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fastcp')
conflicts=('fastcp-bin')
source=("fastcp::git+https://github.com/CallMeAlphabet/fastcp.git#branch=rust")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fastcp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fastcp"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$srcdir/fastcp"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/fastcp"
    install -Dm755 "target/release/fastcp" "$pkgdir/usr/bin/fastcp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
