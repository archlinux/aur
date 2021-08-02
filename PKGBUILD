# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud
pkgver=1.0.5
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'config.toml')
sha256sums=('a4e22d5d48b2810c86cd3fc2eec83a24b958fc2de87dc0f95ab449598dfe5530'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target="$CARCH-unknown-linux-gnu" --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target="$CARCH-unknown-linux-gnu" --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/$CARCH-unknown-linux-gnu/release/amdfand" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.APACHE2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.txt"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT.md"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 services/amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/config.toml" -t "$pkgdir/etc/$pkgname/"
}
