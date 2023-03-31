# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

_pkgname=glif
pkgname=mfek-$_pkgname
pkgver=2.0.0b1
pkgrel=1
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb
         sdl2)
makedepends=(cargo
             cmake
             python)
optdepends=('mfek-metadata: read and write font metadata')
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('91f1588e78e9c6f075ceb1c1e446e55f4e85c92d768d3b8ad6b8e0808653e447')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features sdl2-dynamic,reproducible-build
}

check() {
	cd "$_archive"
	cargo test --frozen --features sdl2-dynamic,reproducible-build
}


package() {
	cd "$_archive"
	install -Dm0755 "target/release/MFEK$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
