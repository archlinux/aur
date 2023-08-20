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
sha512sums=('0cb930a3efb2ae42dedf6deccb8c2470e522dfd70a1c518847d17d86539b59bb036fbb8237ca8d6ed3b1b24d99bc2c0e42e5947311676da4f776dc85ac30b643')
backup=('etc/raspberry-fan/config.kdl')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
  cd "${pkgname}"
	cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}"

	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 config.kdl "${pkgdir}/etc/${pkgname}/config.kdl"
	install -Dm644 ${pkgname}.system -t "${pkgdir}/usr/lib/systemd/system/"
}
