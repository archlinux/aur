# Maintainer: SelfRef <arch@selfref.dev>

pkgname=foldav
pkgver=0.1.0
pkgrel=1
pkgdesc='A file manager for the files in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/foldav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring')
makedepends=('cargo' 'blueprint-compiler' 'gettext')
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fa043099c3e2434d648121d95c02ea391056e0874c416aceee6975dd185669d')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p foldav-linux
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace
}

package() {
	cd "$pkgname-$pkgver/foldav/linux"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
