# Maintainer: Valentin Radu
#
# Package name is "pent". If that is taken on AUR, use "pent-sandbox".
pkgname=pent
pkgver=0.0.1
pkgrel=1
pkgdesc="Wrap any process in a filesystem and network sandbox"
arch=('x86_64' 'aarch64')
url="https://github.com/valentinradu/Pent"
license=('MIT')
depends=('libcap')
makedepends=('cargo')
install="pent.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/valentinradu/Pent/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2021ee167a8959bea812caf0963bdc548de461cb49e47f7cd0e502cd9d72d180')

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
