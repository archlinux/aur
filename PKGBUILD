# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='shd'
pkgver='0.1.4'
pkgrel='2'
pkgdesc='Console tool to display drive list with commonly checked smart info'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/alttch/$pkgname"
license=('MIT')
depends=('smartmontools>=7.0')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff::$url/commit/f446dfed282c94c0f38cd01a81ce62e8fb3bfa38.diff"
	"$pkgname-$pkgver-$pkgrel-update-deps-1.diff::$url/commit/3c4ebfd791afb879b5552038e5a217b11f59bc0c.diff"
	"$pkgname-$pkgver-$pkgrel-update-deps-2.diff::$url/commit/a161c2dd2da25149f067cbd988b523b34056fe94.diff"
)
sha512sums=('5a8ce04b2428c389dfef30a7010afacb27387463008c70c3d89db729f0b91bedda5819297b4cca35d3c0cb4dce55592d3451ed85bc99237c19cc79200a1fe640'
            'da7a2259358f77dd93cad6a0705655349c734f93880d8ff4b65990a334713f42836ed78b95bda45d4baad66dbd4a53734ffd31351e475be8c50792e202131c6f'
            '65e08d635bc2e136cb637bd71a81179aa6fdbfe26146fcdd2c9ceb3b3c0727099debf30fffe3df5ec4ebddbef57284dc3f930279b42db99645bd52fe48cd9c7f'
            'c05bb04bb38d2267e006ecd62a13be416a600575489033bc14c126e69351560ea69305f3a8d200538abb3431c53ff866ccd35a7e22da1230596b4496236c8d38')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Add missing lockfile update commit
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-fix-cargo-lock.diff"

	# Update deps to fix segfault
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-update-deps-1.diff"
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-update-deps-2.diff"

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
