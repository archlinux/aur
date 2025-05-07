# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lukaj
pkgver=0.2.0
pkgrel=2
pkgdesc='Interactive diff tool for SVG images'
arch=(x86_64)
url="https://github.com/adamws/$pkgname"
license=(GPL-3.0-only)
depends=(cairo
         gcc-libs
         gdk-pixbuf2
         glibc
         libxml2
         pango
         sdl2-compat
         sdl2_ttf)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0ad8546d0541df9e5f49d6760ad83a928a0c97abd77e62a33930c5735d8601c9')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release --features use-rsvg
}

check() {
	_srcenv
	# Many tests assume access to video device
	# cargo test --frozen --features use-rsvg
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
