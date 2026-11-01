# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=conflux
pkgname="$_pkgbase-gtk"
pkgver=2.0.0
pkgrel=1
pkgdesc='GNOME app to set up and watch conflux syncs'
arch=('x86_64' 'aarch64')
url='https://github.com/AperteDev/conflux'
license=('GPL-3.0-or-later')
depends=('conflux' 'gcc-libs' 'glib2' 'glibc' 'gtk4' 'libadwaita>=1:1.7' 'openssl' 'polkit' 'zlib')
makedepends=('blueprint-compiler' 'cargo' 'git')
optdepends=("libsecret: keep the remotes' passwords in the keyring")
provides=("$pkgname")
conflicts=("$pkgname")
options=('!lto')
source=("$_pkgbase::git+$url.git#tag=v$pkgver")
sha256sums=('ee503fa9dc9f93b8785d4390a7d9657d6ae5abf037a12757a565cdf142d878bc')

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
}
