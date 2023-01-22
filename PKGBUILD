# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.4.2
_commit=22f8aed
pkgrel=1
pkgdesc='Open source client library for Spotify'
arch=('x86_64' 'aarch64')
url='https://github.com/librespot-org/librespot'
license=('MIT')
depends=(
	'alsa-lib'
	'gst-plugins-base-libs'
	'jack'
	'libpulse'
	'portaudio'
	'sdl2')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('EC57B7376EAFF1A0BB56BB0187F5FDE8A56219F4') ## Roderick van Domberg

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --features \
		alsa-backend,portaudio-backend,pulseaudio-backend,jackaudio-backend,rodio-backend,rodiojack-backend,sdl-backend,gstreamer-backend
}

## 0 tests
# check() {
# 	export RUSTUP_TOOLCHAIN=stable
# 	cd "$pkgname"
# 	cargo test --frozen --features \
# 		alsa-backend,portaudio-backend,pulseaudio-backend,jackaudio-backend,rodio-backend,rodiojack-backend,sdl-backend,gstreamer-backend
# }

package() {
	cd "$pkgname"
	install -Dv "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 "contrib/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 "contrib/$pkgname.user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
