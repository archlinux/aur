# Maintainer: nezu <nezu@nezu.cc>
pkgname=aero2solver
pkgver="1.1.0"
pkgrel=2
pkgdesc="Solve Aero2 captchas automatically using the magic of machine learning and computer vision"
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dumbasPL/aero2solver"
license=('MIT')
makedepends=('cargo' 'cmake' 'clang')
options=(!debug !lto)
provides=('aero2solver')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.service"
	"$pkgname.sysusers"
)
sha256sums=('c9b86bab0f538ae0cb4c39a9578ee0f580101b91e439322baba7ae822cc63039'
            '04e89d56ab4cd3eaf1271c829b562606bfd57b63d0346b2773266cb5c0c1eca6'
            '4a39fe28d2dccb6defecbd38331269ca124b73553d420b101a0d8443db77b94b')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export MODEL_PATH=/usr/share/$pkgname/model
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "model/captcha.cfg" "$pkgdir/usr/share/$pkgname/model/captcha.cfg"
	install -Dm644 "model/captcha.names" "$pkgdir/usr/share/$pkgname/model/captcha.names"
	install -Dm644 "model/captcha.weights" "$pkgdir/usr/share/$pkgname/model/captcha.weights"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
