pkgname=mqttui
pkgver=0.19.0
pkgrel=3
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
provides=("${pkgname}")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('76d39f14920eb1cf1a65239f1e54c840f20b35c2be96f074819be5175427a7e7')

build() {
	cd $pkgname-$pkgver
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin"
	install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "target/completions/${pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "target/completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "target/completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
}
