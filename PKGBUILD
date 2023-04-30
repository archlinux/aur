# Maintainer: scarlettekk <scarlett AT enby DOT site>
# Contributor: willemw <willemw12@gmail.com>

pkgname=gdrive-git
pkgver=3.9.0.r4.gf03868a
pkgrel=1
pkgdesc="Google Drive CLI Client (Rust rewrite)"
arch=('x86_64' 'aarch64')
url="https://github.com/glotlabs/gdrive"
license=('MIT')
makedepends=('git' 'cargo')
options=('!lto')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

#check() {
#    cd $pkgname
#    export RUSTUP_TOOLCHAIN=stable
#    export CARGO_TARGET_DIR=target
#    cargo test --frozen --all-features
#}

package() {
    cd $pkgname
    install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
