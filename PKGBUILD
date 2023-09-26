# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pwrate'
pkgver='1.6.0'
pkgrel='1'
pkgdesc='Primitive sample rate chooser for PipeWire'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pkunk/$pkgname"
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d24b989170c259a483f5ee166fa5b31fb6a48475829d28f27530661640f8039a088fa3bf83a31a64bf6f6b068c7823619cded74fe8a7b7fe06cda0a040076fdc')

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
