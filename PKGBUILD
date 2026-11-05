# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=foldav
pkgname="$_pkgbase-git"
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc='A file manager for the files in your Nextcloud'
arch=('x86_64')
url='https://github.com/AperteDev/foldav'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.8' 'libsecret' 'sqlite' 'glib2' 'libgcc' 'glibc')
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
	# Before the first release's tag there is nothing to describe: 0.0.0 sorts below it.
	if described=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		echo "$described" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
	else
		printf '0.0.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
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
	cargo build --frozen --release -p foldav-linux
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --workspace
}

package() {
	cd "$_pkgbase/foldav/linux"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
