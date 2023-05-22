# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.5'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools>=7.0')
makedepends=('cargo')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('49842949ce1a6af753f513a7b92578f825185514a9407becb0611fe06676045abbc690b252c2eb6735ac1e6a97a802ed3fdb2b442f4040e5f6ee3855ed1f48a2')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Prepare correct target for our architecture
	_cargotarget="$CARCH-unknown-linux-musl"

	if [ "$CARCH" = 'armv7h' ]; then
		_cargotarget='armv7-unknown-linux-musleabihf'
	fi

	cargo fetch --locked --target "$_cargotarget"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export RUSTUP_TOOLCHAIN='stable'
	export CARGO_TARGET_DIR='target'
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
