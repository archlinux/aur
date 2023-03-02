# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pwrate'
pkgver='1.4.0'
pkgrel='1'
pkgdesc='Primitive sample rate chooser for PipeWire'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/pkunk/$pkgname"
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('cargo')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('773f752b43026c87f1644ad6a73b147ba15e8b82d80e5998e257ced97cfb0ac3df2e9594640c747fe24fc48db7a5414c1c12004a3f4d6a46739199f236cc1ffc')

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
