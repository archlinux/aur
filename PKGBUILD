# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=ra-pixelart-scale-git
pkgver=v0.1.0.r0.gf183227
pkgrel=1
pkgdesc='Scale PixelArt images using RetroArch shaders.'
arch=(any)
url='https://github.com/Azq2/ra-pixelart-scale'
license=(GPL-3.0)
depends=()
makedepends=(cargo)
source=(git+https://github.com/Azq2/ra-pixelart-scale)
sha256sums=('SKIP')

prepare() {
	cd "ra-pixelart-scale"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "ra-pixelart-scale"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "ra-pixelart-scale"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0755 -d -t "$pkgdir/usr/share/ra-pixelart-scal/shaders" "shaders"
}

pkgver() {
	cd "ra-pixelart-scale"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
