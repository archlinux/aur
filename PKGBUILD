# Maintainer: Alex Poor <alex@karo.co.nz>
pkgname=alavai
pkgver=0.2.4
pkgrel=1
pkgdesc="Lightweight Tailscale client for Linux with one-click tailnet switching"
arch=('x86_64')
url="https://github.com/alex-poor/alavai"
license=('GPL-3.0-or-later')
# Display libs: alavai's GUI/tray (iced + winit) is built with BOTH the Wayland
# and X11 backends and picks one at runtime, so a single package runs on any
# session — `wayland` covers Wayland, `libx11` covers X11 (it pulls libxcb), and
# `libxkbcommon` handles keymaps on both. winit dlopen()s all of them, so the
# `alavai` CLI alone needs none; they're hard deps so the tray/window work out of
# the box after install. (libxcursor/libxi are optional niceties winit degrades
# without.)
depends=('tailscale' 'xdg-utils' 'wayland' 'libxkbcommon' 'libx11' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
# The tray icon needs a StatusNotifierItem host (KDE, GNOME+AppIndicator,
# Waybar, …); the window works without one. See docs/PACKAGING.md.
optdepends=('ttf-dejavu: a sans + monospace font for the UI')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6641978cff9bf0b2d42cbdc6c68744e222326b17c3b3cec65665dea81571d2f6')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Runs the LocalAPI golden-fixture tests; the live-daemon test is #[ignore]d,
	# so this needs no running tailscaled. --release reuses build()'s artifacts.
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "dist/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "dist/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Start the tray on login so the headline surface is there after a reboot.
	# Users can turn this off in-app (or `alavai autostart off`), which masks
	# this entry with a Hidden=true user override.
	install -Dm644 "dist/$pkgname-tray.desktop" "$pkgdir/etc/xdg/autostart/$pkgname-tray.desktop"
}
