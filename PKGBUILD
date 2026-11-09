# Maintainer: chadsr <git at ross dot ch>

pkgname=sheprd
pkgver=20261108.1 # renovate: datasource=github-releases depName=sheprd-labs/sheprd
pkgrel=1
pkgdesc="Native GPUI client for an installed Herdr daemon (formerly herdr-gpui)"
arch=('x86_64' 'aarch64')
url="https://github.com/sheprd-labs/sheprd"
license=('Apache-2.0')
depends=(
	'libgcc'
	'libstdc++' # vendored C/C++ (Luau)
	'sqlite'
	'alsa-lib'
	'libxcb'
	'libxkbcommon'
	'libxkbcommon-x11'
	'wayland'
	'vulkan-icd-loader'
	'hicolor-icon-theme'
)
makedepends=('cargo' 'fontconfig' 'freetype2' 'sqlite') # -sys build scripts probe pkg-config
optdepends=(
	'xdg-utils: open URLs in your browser'
	'git: remote workspaces and unpushed-work checks'
	'openssh: remote workspaces and git over SSH'
	'wl-clipboard: clipboard on Wayland'
	'xclip: clipboard on X11'
	'vulkan-radeon: Vulkan driver for AMD GPUs'
	'vulkan-intel: Vulkan driver for Intel GPUs'
)
provides=('herdr-gpui')
conflicts=('herdr-gpui' "$pkgname-bin")
replaces=('herdr-gpui')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('417cec841a6de9474d05f583054ab0d76868951283d3ff0d83cb8156319835b3cc6e5372dfff251ddd3ea8e448254d17cd3afafd6557e7cb8aa155e65a12c455')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	export HERDR_RELEASE_VERSION="$pkgver"
	export GIT_CEILING_DIRECTORIES="$srcdir"
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

	cargo build --frozen --release \
		-p sheprd-gpui \
		-p sheprd-acp \
		-p sheprd-automate \
		-p sheprd-nearby \
		-p sheprd-remote-control
}

check() {
	cd "$pkgname-$pkgver"
	export CARGO_TARGET_DIR=target
	export GIT_CEILING_DIRECTORIES="$srcdir"

	cargo test --frozen --release -p sheprd-gpui --test cli
	cargo test --frozen --release --lib \
		-p sheprd-acp -p sheprd-automate -p sheprd-nearby -p sheprd-remote-control
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" \
		target/release/{sheprd,sheprd-acp,sheprd-automate,sheprd-nearby,sheprd-remote-control}

	# legacy pre-rename names
	ln -s sheprd "$pkgdir/usr/bin/herdr-gpui"
	ln -s sheprd-acp "$pkgdir/usr/bin/herdr-acp"
	ln -s sheprd-automate "$pkgdir/usr/bin/herdr-automate"
	ln -s sheprd-nearby "$pkgdir/usr/bin/herdr-nearby"
	ln -s sheprd-remote-control "$pkgdir/usr/bin/herdr-remote-control"

	install -Dm0644 scripts/release/org.sheprd.Sheprd.desktop \
		"$pkgdir/usr/share/applications/org.sheprd.Sheprd.desktop"
	install -Dm0644 assets/icons/sheprd-linux.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/sheprd.svg"

	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" \
		LICENSE NOTICE assets/icons/LICENSE-octicons \
		crates/sheprd-protocol/LICENSE-APACHE crates/sheprd-protocol/NOTICE.md \
		crates/sheprd-gpui/SOUND-NOTICE.md
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
