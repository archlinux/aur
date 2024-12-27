# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.6'
pkgrel='2'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools>=7.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e2b80ff64dae23d38cb3e4b0209db0dd8091cd528c09600b2e051f75804ceb055f21dd33acdd96ef7c69e2ad5190a844f00bbba8f463c04089d986fd689ac313')

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
