# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='inputmodule-rs'
pkgname='inputmodule-control'
pkgver='0.2.0'
pkgrel='1'
pkgdesc='Command line utility to control Framework Laptop 16 input modules'
arch=('x86_64')
url="https://github.com/FrameworkComputer/$_projectname"
license=('MIT')
depends=('libasound.so' 'libudev.so')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('068f26d83ee68e6e1b71954add4a9df740426596f3f6301cb5f24b898e17d41f70f1d3245afe6e2b601e09a72c8dfb868fae65f8a9e9c439cde40eddbd8a47a9')

_sourcedirectory="$_projectname-$pkgver"
_cargotarget="$(rustc -vV | sed -n 's/host: //p')"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --frozen --release --target "$_cargotarget" --package "$pkgname" --all-features
}

check() {
	"$srcdir/$_sourcedirectory/target/$_cargotarget/release/$pkgname" --help | grep -q 'RAW HID and VIA commandline'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/$_cargotarget/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'release/50-framework-inputmodule.rules' "$pkgdir/usr/lib/udev/rules.d/50-framework-inputmodule.rules"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
