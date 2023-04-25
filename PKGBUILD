# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>
pkgname=noseyparker
pkgver=0.13.0
pkgrel=1
pkgdesc="find secrets and sensitive information in textual data and Git history"
arch=(any)
url="https://github.com/praetorian-inc/noseyparker"
license=('Apache-2')
makedepends=('cargo')
depends=(hyperscan)
conflicts=(noseyparker-git)
source=("${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('e2fb40871d9b2bab200db808c7e25620484be3894ea2612563461c59ebd98cc9')


prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	if [[ "$(target/release/${pkgname} --version)" != "$pkgname ${pkgver}" ]]; then
		echo "Failed simple version check of built binary"
		exit 10
	else
		echo "Simple version check of built binary worked"
	fi
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
