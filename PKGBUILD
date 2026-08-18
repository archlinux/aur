# Maintainer: Dilant <dilant@qq.com>

pkgname=celemod
pkgver=1.1.9
pkgrel=2
pkgdesc="An alternative mod manager for Celeste"
arch=('x86_64')
url="https://github.com/std-microblock/CeleMod"
license=('GPL-3.0-or-later')
depends=(
	'gcc-libs'
	'glib2'
	'gtk3'
	'libsoup3'
	'webkit2gtk-4.1'
)
makedepends=(
	'cargo-nightly'
	'cmake'
	'nodejs>=20'
	'pnpm'
)

provides=('cele-mod')
options=('!lto')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/std-microblock/CeleMod/archive/refs/tags/v$pkgver.tar.gz"
	'CeleMod.desktop'
	'disable-self-update.patch'
)
sha256sums=(
	'85c16bc87bdcd7cdab4789f2bc0b375c03199f7786de0f078d4e54915a75c5b7'
	'683c5ab3017cb560d715576e0eb0342833f22b52ad17d9594499dfd2a7655c42'
	'0de0b5e93d462d4f27ca7a37f93a95013c82f0cc643ebd7dfc4c0bfc780fa186'
)

prepare() {
	cd "$srcdir/CeleMod-$pkgver"
	export RUSTUP_TOOLCHAIN=nightly
	patch -p1 -i "$srcdir/disable-self-update.patch"
	cargo fetch --locked --target x86_64-unknown-linux-gnu
	pnpm install --dir src/celemod-ui --frozen-lockfile
}

build() {
	cd "$srcdir/CeleMod-$pkgver"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR="$srcdir/CeleMod-$pkgver/target"
	export CARGO_NET_OFFLINE=true
	export CMAKE_POLICY_VERSION_MINIMUM=3.5
	pnpm --dir src/celemod-ui tauri build --bundles deb
}

package() {
	cd "$srcdir/CeleMod-$pkgver"
	install -Dm755 target/release/cele-mod \
		"$pkgdir/usr/bin/cele-mod"
	install -Dm644 "$srcdir/CeleMod.desktop" \
		"$pkgdir/usr/share/applications/CeleMod.desktop"
	install -Dm644 resources/icon.png \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/cele-mod.png"
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
