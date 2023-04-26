# Maintainer: scarlettekk <scarlett AT enby DOT site>
# Maintainer: willemw <willemw12@gmail.com>

pkgname=gdrive-git
pkgver=3.9.0.r2.g57e5ea6
pkgrel=1
pkgdesc="Google Drive CLI Client (Rust rewrite, git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/glotlabs/gdrive"
license=('MIT')
makedepends=('git' 'cargo')
provides=('gdrive')
conflicts=('gdrive')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    cd $pkgname
}

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/gdrive"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

