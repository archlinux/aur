# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=notav
pkgname="$_pkgbase-git"
pkgver=0.1.0.r0.g7a48a0e
pkgrel=1
pkgdesc='Notes and a journal kept in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/notav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'gtksourceview5' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
optdepends=('gnome-online-accounts: sign in with a GNOME Online Accounts account'
            'org.freedesktop.secrets: keep the passwords in the system keyring')
makedepends=('git' 'cargo' 'blueprint-compiler' 'gettext')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p notav-linux
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace
}

package() {
	cd "$_pkgbase/linux"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
