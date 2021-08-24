# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.2'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools')
makedepends=('cargo')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('67e39ba1a1aff285bbd5d2eead8d15da7ab657a39231263eadaebc7423397d44')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	_cargotarget="$CARCH-unknown-linux-musl"

	if [ "$CARCH" = 'arm' ]; then
		_cargotarget="${_cargotarget}eabihf"
	fi

	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='build'
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
