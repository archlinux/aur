# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.4'
pkgrel='1'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'arm' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff::$url/commit/f446dfed282c94c0f38cd01a81ce62e8fb3bfa38.diff"
)
sha512sums=('5a8ce04b2428c389dfef30a7010afacb27387463008c70c3d89db729f0b91bedda5819297b4cca35d3c0cb4dce55592d3451ed85bc99237c19cc79200a1fe640'
            'da7a2259358f77dd93cad6a0705655349c734f93880d8ff4b65990a334713f42836ed78b95bda45d4baad66dbd4a53734ffd31351e475be8c50792e202131c6f')

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
