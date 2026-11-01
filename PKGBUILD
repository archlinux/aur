# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-gtk-git"
pkgver=1.1.0.r41.g79d4347
pkgrel=1
pkgdesc='GNOME app to set up and watch conflux syncs'
arch=('x86_64' 'aarch64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('conflux' 'gcc-libs' 'glib2' 'glibc' 'gtk4' 'libadwaita>=1:1.7' 'openssl' 'polkit' 'zlib')
makedepends=('blueprint-compiler' 'cargo' 'git')
optdepends=("libsecret: keep the remotes' passwords in the keyring")
provides=("$_pkgbase-gtk")
conflicts=("$_pkgbase-gtk")
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
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Builds the app knowing where its helper is installed.
	make build-gtk
}

check() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen -p conflux-gtk -p conflux-helper
}

package() {
	cd "$_pkgbase"
	make install-gtk DESTDIR="$pkgdir"
	mv "$pkgdir/usr/share/licenses/$_pkgbase-gtk" "$pkgdir/usr/share/licenses/$pkgname"
}
