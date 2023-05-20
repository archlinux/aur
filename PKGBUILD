# Maintainer: éclairevoyant
# Contributor: Caleb Maclennan <caleb at alerque dot com>
# Contributor: DaZ <daz dot root+arch at gmail dot com>

_pkgname=gnvim
pkgname="$_pkgname-git"
pkgver=0.3.1.r2.3705700
pkgrel=1
pkgdesc="Opinionated GTK4 Neovim GUI"
arch=(x86_64 aarch64 i686)
url="https://github.com/vhakulinen/$_pkgname"
license=(MIT)
depends=(gtk4 'neovim>=0.9')
makedepends=(cargo git)
checkdepends=(xorg-server-xvfb)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=(SKIP)

prepare() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable

	sed -i 's|/usr/local|/usr|' ui/src/arguments.rs
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd $_pkgname
	export RUSTUP_TOOLCHAIN=stable
	xvfb-run cargo test --frozen --all-features
}

package() {
	make -C $_pkgname PREFIX="/usr" DESTDIR="$pkgdir" install
}
