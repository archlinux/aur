# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=raspberry-fan
pkgver=0.1.1
pkgrel=2
pkgdesc='Fan control service for Raspberry Pi'
url='https://codeberg.org/pitbuster/raspberry-fan'
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/pitbuster/$pkgname/archive/$pkgver.tar.gz")
arch=('aarch64')
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo' 'git')
sha512sums=('4cc63b7bc558bebab0f71cf3e800859bc706342c14abc1107fefa19ce711184686997149a5b6d98a05ad5af73c35152a9987c28eb165e3c5f7a6a406b2b6716a')
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
	install -Dm644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system/"
}
