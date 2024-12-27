# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='pwrate'
pkgver='1.7.0'
pkgrel='2'
pkgdesc='Primitive sample rate chooser for PipeWire'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/pkunk/$pkgname"
license=('GPL-3.0-only')
depends=('gtk4' 'pipewire')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('66192c76d8267e2a34932d78259845c1717e1185cf6ba87420f574693cd3704cd97d27fff33b5cd99a0df288447c0b309b35e4d25a8e52e031e21d4310b0a79f')

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
	_checkoutput="$("$srcdir/$_sourcedirectory/target/$_cargotarget/release/$pkgname" --help)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "$pkgname"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	install -Dm755 "target/$_cargotarget/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
