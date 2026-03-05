# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap
pkgver=1.0.4
pkgrel=1
pkgdesc="A modern RDAP (Registration Data Access Protocol) client"
arch=('x86_64' 'aarch64')
url="https://github.com/xtomcom/rdap"
license=('MIT')
depends=('gcc-libs')
provides=('rdap')
conflicts=('rdap')
makedepends=('cargo' 'cmake')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xtomcom/rdap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ef48d1a4e6c9bbb8b69e2d2c8f6ab37acb6cdbc8b87379682d2aebabfc12a3a1')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

