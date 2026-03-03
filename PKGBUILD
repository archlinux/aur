# Maintainer: Valentin Radu
pkgname=pent
pkgver=0.0.5
pkgrel=1
pkgdesc="Wrap any process in a filesystem and network sandbox"
arch=('x86_64' 'aarch64')
url="https://github.com/valentinradu/Pent"
license=('MIT')
depends=('libcap')
makedepends=('cargo')
install="pent.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/valentinradu/Pent/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abcd4dd69c9d1fcca8982036c0c00546153c0bd4924325efa504310d67432edc')

prepare() {
    cd "Pent-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "Pent-$pkgver"
    cargo build --release --locked -p pent
}

check() {
    cd "Pent-$pkgver"
    cargo test --release --locked -p pent
}

package() {
    cd "Pent-$pkgver"
    install -Dm755 target/release/pent "$pkgdir/usr/bin/pent"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Man pages are generated into man/ by build.rs during cargo build.
    for page in man/*.1; do
        gzip -c "$page" > "${page}.gz"
        install -Dm644 "${page}.gz" \
            "$pkgdir/usr/share/man/man1/$(basename "${page}.gz")"
    done
}
