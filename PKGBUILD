# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-criterion
pkgver=1.0.1
pkgrel=1
pkgdesc='Cargo plugin for analyzing and reporting on Criterion-rs benchmarks.'
arch=('any')
url='https://github.com/bheisler/cargo-criterion'
license=('Apache' 'MIT')
depends=('cargo' 'rust')
optdepends=('gnuplot: generate detailed graphs with gnuplot')
# source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")

# Exceptionally fetch crate from crates.io because the repository is missing
# the 1.0.1 tag; the crate was manually compared against the code in the
# repository (at commit df292d5e6170) and, while the do NOT match, the
# differences are only in metadata like bumping the version number and updating
# the changelog; 1.0.1 also includes a relevant fix that, in my experience,
# made 1.0.0 unsuable.
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-criterion/1.0.1/download")
sha256sums=('6c0ae64be9d0d1ad733cd6d2c2776d93c18ba771ffad8a134dfe592c62babd26')

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
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
