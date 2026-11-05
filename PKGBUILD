# Maintainer: SelfRef <arch@selfref.dev>

pkgname=gextant
pkgver=0.1.0
pkgrel=1
pkgdesc='Updates GNOME Shell extensions from their repositories'
arch=('x86_64')
url='https://github.com/AperteDev/gextant'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita>=1:1.7' 'libsecret' 'glib2' 'ca-certificates' 'libgcc' 'glibc')
optdepends=('org.freedesktop.secrets: keep the access tokens in the system keyring')
makedepends=('cargo' 'blueprint-compiler')
# GCC's LTO objects of ring's bundled C code don't link with rustc's lld.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	make install-data PREFIX=/usr DESTDIR="$pkgdir"
}
