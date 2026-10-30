# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-git"
pkgver=1.1.0.r21.ge09831c
pkgrel=1
pkgdesc='Background file-sync daemon syncing local directories to multiple remotes'
arch=('x86_64' 'aarch64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('cargo' 'git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!lto')
backup=('etc/conflux/config.toml')
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin conflux
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	# The daemon's crates only: the GTK app is a package of its own.
	cargo test --frozen
}

package() {
	cd "$_pkgbase"
	make install-cli DESTDIR="$pkgdir"
	mv "$pkgdir/usr/share/licenses/$_pkgbase" "$pkgdir/usr/share/licenses/$pkgname"
}
