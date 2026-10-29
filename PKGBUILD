# Maintainer: xTom <packages@xtom.com>
# Maintainer: Xiufeng Guo <i@m.ac>
pkgname=rdap
pkgver=1.1.0
pkgrel=1
pkgdesc="RDAP (Registration Data Access Protocol) client and API server"
arch=('x86_64' 'aarch64')
url="https://github.com/xtomcom/rdap"
license=('MIT')
depends=('gcc-libs')
provides=('rdap')
conflicts=('rdap')
backup=('etc/default/rdap')
makedepends=('cargo' 'cmake')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xtomcom/rdap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de751363b9bd5df31fbf3b12e64daf7d9283858e0888a713a172dda6804b6c3c')

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
    install -Dm644 packaging/rdap.service "$pkgdir/usr/lib/systemd/system/rdap.service"
    install -Dm600 packaging/rdap.env "$pkgdir/etc/default/rdap"
}
