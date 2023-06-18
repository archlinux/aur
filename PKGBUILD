pkgname=cherryrgb
_pkgname=cherryrgb
pkgver=0.2.8
pkgrel=1
pkgdesc='Cherry RGB Keyboard control software'
arch=('x86_64')
url="https://github.com/skraus-dev/cherryrgb-rs"
license=('MIT')
provides=("${pkgname}")
conflicts=("cherryrgb")
makedepends=('cargo-nightly')
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname.install"
)
install=$pkgname.install
sha256sums=('9895e1f8de8142954cf01ed8011418b103d102ff50644b6049c3b3a8b761e5b4'
            '45eb8463b2750b3721e18f4cc9b4c87252a404a8f934c4e8637900223dc56dd4')

prepare() {
	cd "cherryrgb-rs-$pkgver"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "cherryrgb-rs-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	install -Dm755 "${srcdir}/cherryrgb-rs-$pkgver/target/release/cherryrgb_cli" \
	               -t "${pkgdir}/usr/local/bin/"
	install -Dm644 "${srcdir}/cherryrgb-rs-$pkgver/udev/99-cherryrgb.rules" \
	               -t "${pkgdir}/etc/udev/rules.d/"
}
