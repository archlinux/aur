# Maintainer: SelfRef <arch@selfref.dev>

pkgname=todav
pkgver=1.0.0
pkgrel=1
pkgdesc='Tasks and calendar kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/SelfRef/todav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring'
            'gnome-shell-extension-todav: tasks, month and agenda in the GNOME top bar')
makedepends=('cargo' 'blueprint-compiler' 'gettext')
# GCC's LTO objects of the bundled C code (SQLite, ring) don't link with rustc's lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf7c2800611fc043dd594290f03295115b135b8ee43b73a6b02180e5b7036b3f')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p todav-linux
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace
}

package() {
	cd "$pkgname-$pkgver/todav/linux"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 data/io.github.selfref.Todav-autostart.desktop \
		"$pkgdir/etc/xdg/autostart/io.github.selfref.Todav.desktop"
}
