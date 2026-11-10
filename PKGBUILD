# Maintainer: chadsr <git at ross dot ch>

pkgname=herdr-app
pkgver=0.1.15 # renovate: datasource=github-tags depName=herdrdev/herdr-app
pkgrel=1
pkgdesc="Native desktop workspace for terminals and coding agents that keep running"
arch=('x86_64' 'aarch64')
url="https://github.com/herdrdev/herdr-app"
license=('Apache-2.0')
depends=(
	'libgcc'
	'libxcb'
	'libxkbcommon'
	'libxkbcommon-x11'
	'wayland'
	'vulkan-icd-loader'
	'hicolor-icon-theme'
	'zstd'
)
makedepends=(
	'cargo'
	'clang'
	'fontconfig'
	'freetype2'
	'zig'
)
checkdepends=('vulkan-swrast')
optdepends=(
	'wl-clipboard: clipboard support on wayland'
	'xclip: clipboard support on x11'
	'vulkan-radeon: vulkan driver for amd gpus'
	'vulkan-intel: vulkan driver for intel gpus'
	'herdr-core: herdr core daemon'
)
conflicts=('herdr-app-bin' 'herdr-app-desktop-bin')
options=(!lto)
# bump to the submodule pin: curl -s "https://api.github.com/repos/herdrdev/herdr-app/contents/vendor/ghostty?ref=v$pkgver" | jq -r .sha
_ghostty_sha1=291fd050b9e9c293c8adb6a140742649b7e42d3a
_zig=zig
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	"ghostty-$_ghostty_sha1.tar.gz::https://github.com/ghostty-org/ghostty/archive/$_ghostty_sha1.tar.gz"
	"herdr-app.desktop"
)
b2sums=('e03dd3ea9889f6107db78a97e669713ff13c2e8f8fb3ca0ebd5ec04cb18ca115328d7d1bd14eae8239fb416b79adb78be9404fcea7d36d186ec26628c5c4d05f'
	'62450cf71d7015f092b6fea0e725fbced508107df5b068f2203145a63521ad11a73923182c7db4decbd0548729dfb064276a3edeec051a9841cb8889d6f6ebd0'
	'3753c41a94a9e11021016006cfa2b6f61655d9feddbec72174550db4898bb2b9e311b19e5d8d276a580dc354d8f866021ec78e5f2fe62ebe52aaafda99bbba70')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf vendor/ghostty
	mv "$srcdir/ghostty-$_ghostty_sha1" vendor/ghostty
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export ZIG="$_zig"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	export ZSTD_SYS_USE_PKG_CONFIG=1
	export CARGO_TARGET_DIR=target
	export GIT_CEILING_DIRECTORIES="$srcdir"
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export ZIG="$_zig"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	export ZSTD_SYS_USE_PKG_CONFIG=1
	export GIT_CEILING_DIRECTORIES="$srcdir"
	cargo test --frozen --bins
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/herdr-app"

	install -Dm644 "$srcdir/herdr-app.desktop" "$pkgdir/usr/share/applications/herdr-app.desktop"
	install -Dm644 assets/icons/herdr-ui-icon-clean.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/herdr-app.svg"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE THIRD-PARTY-NOTICES
}
