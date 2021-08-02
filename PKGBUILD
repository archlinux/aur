# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=amdgpud-git
_name=${pkgname%-git}
pkgver=1.0.5.r0.g90e1dcd
pkgrel=1
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=("$pkgname::git+$url"
        'config.toml')
sha256sums=('SKIP'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	cargo build --release --locked --all-features --target="$CARCH-unknown-linux-gnu" --target-dir=target
}

check() {
	cd "$pkgname"
	cargo test --release --locked --target="$CARCH-unknown-linux-gnu" --target-dir=target
}

package() {
	cd "$pkgname"
	install -Dm755 "target/$CARCH-unknown-linux-gnu/release/amdfand" -t "$pkgdir/usr/bin/"
	install -Dm644 services/amdfand.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 "$srcdir/config.toml" -t "$pkgdir/etc/$_name/"
}
