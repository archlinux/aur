# Maintainer: Sabrina Andersen <sabrina@utd.tf>
pkgname=fw16-led-matrixd
pkgver=1.0.0
pkgrel=3
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
sha256sums=('17b6bf9cf1e841d338f51a1a4ceb7731d3c62fdd86f9a86a26ec2d9de609a5a9' 'a9e41bc2ef328c65b70bde3ed9c49ca90b2d2531f865071aacce803074e54579')

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
