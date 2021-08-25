# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.3'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools')
makedepends=('cargo' 'rust>=1.54.0')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff::$url/commit/e2328fa9131e403bd2105f532389f8daebcd1d7f.diff"
)
sha512sums=('66522d2016a84cd83f03a7328cd9e94bf850780af6f0c305106d969e064512c8b602130e9d931a7a5ae4a43ef7cc6271bd63078b3bf2a102d82e8fa09f26fad3'
            '6b75a7417642d1c99a198ad17ab6953e7f52e26e266f9a729409610ea64c9e9bdde742cbd6c1008c7b4dcffef4fcccb702941f4e4e1906429d18f9a427b6ee1b')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Add missing lockfile update commit
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff"

	# Prepare correct target for our architecture
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
