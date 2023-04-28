# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gerb-git
_pkgname=${pkgname%-git}
pkgver=0.0.1alpha.r0.g95e2946
pkgrel=1
pkgdesc='Graphical font editor (GTK + Rust) '
arch=(x86_64)
url="https://github.com/epilys/$_pkgname"
license=(GPL3)
depends=(gtk3
         librsvg
         python)
optdepends=('python-fonttools: Import UFOv2 or other font sources besides UFOv3'
            'python-glyphslib: Import Glyphs sources'
            'python-ufo2ft: Export OTF/TTF fonts')
makedepends=(cargo
             git)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --always --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\+.*r/.r/;s/\.\([ab]\)/\1/'
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --all-features
}


package() {
	cd "$_pkgname"
	install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
