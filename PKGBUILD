# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pwrate'
pkgver='1.5.0'
pkgrel='1'
pkgdesc='Primitive sample rate chooser for PipeWire'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pkunk/$pkgname"
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('111b20bd382ead9be7276904f495414d02db2315f2c27d925c5b6138acaf63f8bc9a5f448cec8f37ffb4870bcb34609b0bf8e75678099f2a977002a93fec5905')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-gnu"

	if [ "$CARCH" = 'armv7h' ]; then
		_cargotarget='armv7-unknown-linux-gnueabihf'
	fi

	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
