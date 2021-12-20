# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname-git
pkgver=1.1.0b2.r8.gc4f7fb0
pkgrel=2
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3
         libxcb
         sdl2)
makedepends=(cargo
             cmake
             git
             python)
optdepends=('mfek-metadata: read and write font metadata')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --tags HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --no-default-features
}

check() {
	cd "$pkgname"
	cargo test --frozen --no-default-features
}

package() {
	cd "$pkgname"
	install -Dm0755 "target/release/MFEK$_pkgname" "$pkgdir/usr/bin/${pkgname%-git}"
}
