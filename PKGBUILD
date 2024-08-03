# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=ra-pixelart-scale-git
pkgver=v0.1.0.r6.g1dc20f8
pkgrel=1
pkgdesc='Scale PixelArt images using RetroArch shaders.'
arch=(any)
url='https://github.com/Azq2/ra-pixelart-scale'
license=(GPL-3.0)
depends=()
makedepends=(cargo-nightly)
source=(git+https://github.com/Azq2/ra-pixelart-scale)
sha256sums=('SKIP')
options=(!lto)

prepare() {
	cd "ra-pixelart-scale"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	git submodule init
	git submodule update
}

build() {
	cd "ra-pixelart-scale"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "ra-pixelart-scale"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ra-pixelart-scale"
	mkdir -p "$pkgdir/usr/share/ra-pixelart-scal/"
	cp -r shaders/ "$pkgdir/usr/share/ra-pixelart-scal/shaders/"
}

pkgver() {
	cd "ra-pixelart-scale"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
