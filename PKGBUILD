# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: DaZ <daz.root+arch@gmail.com>

pkgname=gnvim
pkgver=0.2.0
pkgrel=1
pkgdesc="GUI for neovim, without any web bloat"
url="https://github.com/vhakulinen/$pkgname"
arch=(x86_64 aarch64)
license=(MIT)
depends=(neovim
         gtk4)
makedepends=(cargo)
checkdepends=(xorg-server-xvfb)
_archive=("$pkgname-$pkgver")
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('abacc674ed142b2c807d21b00a2324b32d9babcec1f25a95446d01e3eb0fa386')

prepare() {
	cd "$_archive"
	sed -e 's#/usr/local#/usr#' -i ui/src/arguments.rs
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	xvfb-run cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
