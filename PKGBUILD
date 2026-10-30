# Maintainer: SelfRef <arch@selfref.dev>

pkgname=todav
pkgver=2.3.0
pkgrel=1
pkgdesc='Tasks and calendar kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/todav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring'
            'gnome-shell-extension-todav: tasks, month and agenda in the GNOME top bar')
makedepends=('cargo' 'blueprint-compiler' 'gettext')
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf4fe3d207001d380ec405c15b6a8e25d9cbd721d2a69c8aaa7a455b214aa755')

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
	install -Dm644 data/dev.aperte.Todav-autostart.desktop \
		"$pkgdir/etc/xdg/autostart/dev.aperte.Todav.desktop"
}
