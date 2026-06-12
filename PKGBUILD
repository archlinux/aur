# Maintainer: spartanz51 <a.m@tuta.com>
#
# VCS package — builds the headless TutaBridge CLI/daemon from the latest
# commit. The GUI (Tauri) is intentionally not built here; this package is
# the lean daemon for terminal / server use. For a prebuilt binary with no
# Rust build, see tutabridge-bin.

pkgname=tutabridge-git
pkgver=0.r0.0000000
pkgrel=1
pkgdesc="Local IMAP/SMTP bridge for Tuta encrypted email (headless CLI/daemon)"
arch=('x86_64' 'aarch64')
url="https://github.com/spartanz51/tutabridge"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'dbus')
makedepends=('rust' 'cargo' 'git' 'cmake' 'nasm' 'dbus' 'pkgconf')
optdepends=('gnome-keyring: persist the Tuta session across reboots (Secret Service)'
            'kwallet: alternative Secret Service provider')
provides=('tutabridge')
conflicts=('tutabridge')
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
	# Fetch crates up-front so build() can run fully offline (--frozen).
	export CARGO_HOME="$srcdir/cargo-home"
	cargo fetch --locked
}

build() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir/cargo-home"
	export RUSTUP_TOOLCHAIN=stable
	# Build only the CLI crate — no GUI, no Node, no webkit.
	cargo build --release --frozen -p tutabridge
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/tutabridge" "$pkgdir/usr/bin/tutabridge"
	install -Dm644 "packaging/systemd/tutabridge.service" \
		"$pkgdir/usr/lib/systemd/user/tutabridge.service"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
