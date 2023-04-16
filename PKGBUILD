pkgname=cherryrgb
_pkgname=cherryrgb
pkgver=0.2.3
pkgrel=1
pkgdesc='Cherry RGB Keyboard control software'
arch=('x86_64')
url="https://github.com/skraus-dev/cherryrgb-rs"
license=('MIT')
provides=("${pkgname}")
conflicts=("cherryrgb")
makedepends=('cargo')
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname.install"
)
install=$pkgname.install
sha256sums=('36711619da179887c9ea5f82866fd4ed5e89cab28be4bc70d08794eb7fd5a77d'
            '45eb8463b2750b3721e18f4cc9b4c87252a404a8f934c4e8637900223dc56dd4')

prepare() {
	cd "cherryrgb-rs-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "cherryrgb-rs-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	install -Dm755 "${srcdir}/cherryrgb-rs-$pkgver/target/release/cherryrgb_cli" \
	               -t "${pkgdir}/usr/local/bin/"
	install -Dm644 "${srcdir}/cherryrgb-rs-$pkgver/udev/99-cherryrgb.rules" \
	               -t "${pkgdir}/etc/udev/rules.d/"
}
