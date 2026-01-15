# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=2.0.0b1
pkgrel=2
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb
         sdl2)
makedepends=(rustup
             cmake
             python)
optdepends=('mfek-metadata: read and write font metadata')
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('91f1588e78e9c6f075ceb1c1e446e55f4e85c92d768d3b8ad6b8e0808653e447')

# work around time crate snafu with rust >= 1.80.0
_toolchain=1.79.0

_srcenv() {
	cd "$_archive"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN="$_toolchain"
	CFLAGS+=' -ffat-lto-objects'
}

prepare() {
	_srcenv
	rustup toolchain install "$_toolchain"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	_srcenv
	cargo build --frozen --release --features sdl2-dynamic,reproducible-build
}

check() {
	_srcenv
	cargo test --frozen --features sdl2-dynamic,reproducible-build
}


package() {
	cd "$_archive"
	install -Dm0755 "target/release/MFEK$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
