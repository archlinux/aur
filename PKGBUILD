# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=gextant
pkgname="$_pkgbase-git"
pkgver=0.1.0.r35.g61d4acf
pkgrel=1
pkgdesc='Updates GNOME Shell extensions from their repositories'
arch=('x86_64')
url='https://github.com/AperteDev/gextant'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.7' 'libsecret' 'glib2' 'ca-certificates' 'libgcc' 'glibc')
optdepends=('org.freedesktop.secrets: keep the access tokens in the system keyring')
makedepends=('git' 'cargo' 'blueprint-compiler')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	# Before the first tag there is nothing to describe: the commits count from 0.1.0.
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		printf '%s\n' "$desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
	else
		printf '0.1.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
	cargo build --frozen --release
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
