# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='inputmodule-control'
pkgver='0.2.0'
pkgrel='2'
pkgdesc='Command line utility to control Framework Laptop 16 input modules'
arch=('x86_64')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
depends=('inputmodule-udev' 'libasound.so' 'libudev.so')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('068f26d83ee68e6e1b71954add4a9df740426596f3f6301cb5f24b898e17d41f70f1d3245afe6e2b601e09a72c8dfb868fae65f8a9e9c439cde40eddbd8a47a9')

_sourcedirectory="$_projectname-$pkgver"

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
	cargo build --frozen --release --target "$_cargotarget" --package "$pkgname" --all-features
}

check() {
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	_checkoutput="$("$srcdir/$_sourcedirectory/target/$_cargotarget/release/$pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgname $pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	_cargotarget="$(rustc -vV | sed -n 's/host: //p')"
	install -Dm755 "target/$_cargotarget/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
