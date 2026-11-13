# Maintainer: chadsr <git at ross dot ch>

pkgname=herdr-core
pkgver=0.1.21 # renovate: datasource=github-tags depName=herdrdev/herdr-core
pkgrel=1
pkgdesc="Run programs and coding agents in terminals that stay alive after you leave"
arch=('x86_64' 'aarch64')
url='https://github.com/herdrdev/herdr-core'
license=('Apache-2.0')
depends=('libgcc')
makedepends=('cargo' 'zig')
conflicts=('herbstluftwm' "$pkgname-bin" "$pkgname-git")

# bump to the submodule pin: curl -s "https://api.github.com/repos/herdrdev/herdr-core/contents/vendor/ghostty?ref=v$pkgver" | jq -r .sha
_ghostty_sha1=1e5cdb865807abc990181efb8ebfa9122955cce2
_zig=zig

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"ghostty-$_ghostty_sha1.tar.gz::https://github.com/ghostty-org/ghostty/archive/$_ghostty_sha1.tar.gz"
)
b2sums=('40b370279e099a11c3da27632dabf863fb2d771f8ae70478dec7abe2b1fdb53ce8aaaffb876bd13ae9d51b9bdafef13f558e411e18d435f3df7fbc2a4161f5f1'
	'b56600fcae921bd22438e855d90d95bf9bee0b80755a1fae89268f68f66b4ce1e4178141b8f6ae9b83922822fa76ce70fc1be6c61bb357e442c259e2709bcc5a')

prepare() {
	cd "$pkgname-$pkgver"

	rm -rf vendor/ghostty
	mv "$srcdir/ghostty-$_ghostty_sha1" vendor/ghostty

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	export ZIG="$_zig"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	(cd vendor/ghostty && "$ZIG" build -Demit-lib-vt -Doptimize=ReleaseFast -Dcpu=baseline \
		--prefix "$srcdir/zig-warm-out" --cache-dir "$srcdir/zig-warm-cache")
}

build() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	export ZIG="$_zig"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"

	cargo build --frozen --release -p herdr-core
}

check() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	export ZIG="$_zig"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"

	cargo test --frozen --lib --bins
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 target/release/herdr-core -t "$pkgdir/usr/bin/"
	ln -s herdr-core "$pkgdir/usr/bin/hc"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
