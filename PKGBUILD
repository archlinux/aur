# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pwrate'
pkgver='1.7.1'
pkgrel='2'
pkgdesc='Primitive sample rate chooser for PipeWire'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pkunk/$pkgname"
license=('GPL-3.0-only')
depends=('glib2' 'gtk4' 'pipewire')
makedepends=('cargo')
checkdepends=('xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('825920fa7ac1a475c2fed2e4e9dc563555f4049c6b5373ce119d7ea80be64e8fea42c3b558fd9397c9d19f6346bbac54fe72b26a8304508e620dfde8adf7a1fd')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	cargo build --frozen --release --target "$_cargotarget" --all-features
}

check() {
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	_checkoutput="$(xvfb-run "$srcdir/$_sourcedirectory/target/$_cargotarget/release/$pkgname" --help)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "$pkgname"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	install -Dm755 "target/$_cargotarget/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
