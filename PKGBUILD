# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=amdgpud
pkgver=1.0.4
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
sha256sums=('1de49ec9fff89e092a70bca12c97445876c00a314615727a98359d5d9f87db59'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

prepare() {
	cd "$pkgname-$pkgver"
	## use glibc
	rm .cargo/config
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/amdfand" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.APACHE2.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE.md"
	install -Dm644 LICENSE.MIT.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 "$srcdir/config.toml" -t "$pkgdir/etc/$pkgname/"
}
