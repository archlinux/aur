# Maintainer: Sabrina Andersen <sabrina@utd.tf>
pkgname=fw16-led-matrixd
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform daemon for controlling the Framework 16 LED Matrixes"
arch=('x86_64' 'i686')
url="https://github.com/NukingDragons/fw16-led-matrixd"
license=('MIT')
makedepends=('git' 'rust')
optdepends=('systemd: systemd service support')
conflicts=('fw16-led-matrixd-git')
backup=('etc/fw16-led-matrixd/config.toml')
validpgpkeys=('B2FA6C185A694EFB2A2A1612EDB944713B73E150')
options=('!debug')
source=("https://github.com/nukingdragons/fw16-led-matrixd/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('4619c399678b929c541728ee80ece51cfda677fea0a750a9bbf0f68205b5811f' '7cef13e1d577f004cd4ce1fa486676b88e711ef2ed78142b4c003e7152af8af1')

prepare()
{
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build()
{
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features
}

check()
{
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen --all-features
}

package()
{
	cd "$pkgname-$pkgver"

	install -Dm755 target/release/fw16-led-matrixd "${pkgdir}/usr/bin/fw16-led-matrixd"
	install -Dm755 target/release/ledcli "${pkgdir}/usr/bin/ledcli"
	install -Dm644 sample-posix-config.toml "${pkgdir}/etc/fw16-led-matrixd/config.toml"
	install -Dm644 daemon/fw16-led-matrixd.service "${pkgdir}/usr/lib/systemd/system/fw16-led-matrixd.service"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
