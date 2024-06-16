# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname='synth'
pkgver='0.6.9'
pkgrel=5
pkgdesc='The Open Source Data Generator'
url='https://getsynth.com/'
arch=('any')
license=('Apache-2.0')
source=("https://github.com/shuttle-hq/synth/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f89fc355dc0e311a6e5e0e8047f4721f23e35cdcb3355e85c7c66e8e2e67da91')
makedepends=('cargo-nightly' 'sqlite')
depends=('sqlite')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo +nightly build --frozen --release --bin synth
}

check() {
	cd "$pkgname-$pkgver"
	cargo +nightly test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
