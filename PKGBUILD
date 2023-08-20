# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=raspberry-fan
pkgver=0.1.0
pkgrel=1
pkgdesc='Fan control service for Raspberry Pi'
url='https://codeberg.org/pitbuster/raspberry-fan'
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/pitbuster/$pkgname/archive/$pkgver.tar.gz")
arch=('aarch64')
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo' 'git')
sha512sums=('SKIP')
backup=('etc/raspberry-fan/config.kdl')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
  cd "${pkgname}-${pkgver}"
	cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 config.kdl "${pkgdir}/etc/${pkgname}/config.kdl"
	install -Dm644 ${pkgname}.system -t "${pkgdir}/usr/lib/systemd/system/"
}
