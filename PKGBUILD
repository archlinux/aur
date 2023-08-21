# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=raspberry-fan
pkgver=0.1.2
pkgrel=1
pkgdesc='Fan control service for Raspberry Pi'
url='https://codeberg.org/pitbuster/raspberry-fan'
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/pitbuster/$pkgname/archive/$pkgver.tar.gz")
arch=('aarch64')
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo' 'git')
sha512sums=('0361a802f2a9724fc1a281d5a5b8f37937c2066b9449fabf91c02d577a53d0fe91719cc88ac0a4dbc2502f85e3caea4d6c2696a625d2d5d4e387ab1a6602a0c2')
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
