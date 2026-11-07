# Maintainer: SelfRef <arch@selfref.dev>

pkgname=notav
pkgver=0.5.1
pkgrel=1
pkgdesc='Notes and a journal kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/notav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'gtksourceview5' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring')
makedepends=('cargo' 'blueprint-compiler' 'gettext')
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a690fe02d9c18bee61cad99fbac9fedd8d0227f5460ce845777107b8fd60bce')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p notav-linux
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace
}

package() {
	cd "$pkgname-$pkgver/linux"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
