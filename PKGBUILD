# Maintainer: spartanz51 <a.m@tuta.com>
#
# VCS package — builds the TutaBridge desktop app (the Tauri GUI, bridge
# included) from the latest commit. The headless daemon is tutabridge-git /
# tutabridge-bin: it can be installed next to this one (different binaries,
# same configuration), just not run at the same time. For a prebuilt app
# with no Rust or Node build, see tutabridge-desktop-bin.
pkgname=tutabridge-desktop-git
pkgver=0.r0.0000000
pkgrel=1
pkgdesc="Local IMAP/SMTP bridge for Tuta encrypted email (desktop app)"
arch=('x86_64' 'aarch64')
url="https://github.com/spartanz51/tutabridge"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
makedepends=('rust' 'cargo' 'git' 'cmake' 'nasm' 'pkgconf' 'nodejs' 'npm')
optdepends=('gnome-keyring: persist the Tuta session across reboots (Secret Service)'
            'kwallet: alternative Secret Service provider')
provides=('tutabridge-desktop')
conflicts=('tutabridge-desktop')
# makepkg's lto option puts -flto in CFLAGS, and the C code cargo builds
# (SQLCipher and its OpenSSL) would come out as GCC bytecode, which rust-lld,
# the Rust linker since 1.90, cannot read: the link fails on sqlite3_* symbols.
# Rust code is not affected either way, makepkg leaves RUSTFLAGS alone.
options=(!lto)
source=("$pkgname::git+https://github.com/spartanz51/tutabridge.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# 0.<commits>.<short-sha>
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	# The Tuta Rust SDK is a git submodule and the build needs it.
	git submodule update --init --recursive
	# Fetch crates and frontend packages up-front so build() runs offline.
	export CARGO_HOME="$srcdir/cargo-home"
	cargo fetch --locked
	export npm_config_cache="$srcdir/npm-cache"
	(cd ui && npm ci)
}

build() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	# The GUI crate's build script embeds ui/dist, so the frontend goes first.
	(cd ui && npm run build)
	# Direct cargo builds need this feature to embed and serve the frontend
	# instead of loading devUrl; --release alone does not enable it.
	cargo build --release --frozen -p tutabridge-gui --features tauri/custom-protocol
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/tutabridge-gui" "$pkgdir/usr/bin/tutabridge-gui"
	install -Dm644 "packaging/linux/TutaBridge.desktop" \
		"$pkgdir/usr/share/applications/TutaBridge.desktop"
	install -Dm644 "src-tauri/icons/32x32.png" \
		"$pkgdir/usr/share/icons/hicolor/32x32/apps/tutabridge-gui.png"
	install -Dm644 "src-tauri/icons/128x128.png" \
		"$pkgdir/usr/share/icons/hicolor/128x128/apps/tutabridge-gui.png"
	install -Dm644 "src-tauri/icons/128x128@2x.png" \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/tutabridge-gui.png"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
