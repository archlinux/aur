# Maintainer: Dvd-Znf <email@dvdznf.xyz>

pkgname=komac
pkgver=2.13.0
pkgrel=1
pkgdesc="The Community Manifest Creator for WinGet"
arch=('x86_64')
url="https://github.com/russellbanks/Komac"
license=('GPL-3.0-or-later')
depends=('bzip2' 'gcc-libs')
makedepends=('cargo')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("de416c0b4e0e7e81a5e078a534aff70f8864151c7f53ec5a94a027a7965f01e9")

prepare() {
	cd Komac-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
   	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd Komac-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
   	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -ffat-lto-objects'
    	cargo build --frozen --release
}

check() {
	cd Komac-${pkgver}
    	export RUSTUP_TOOLCHAIN=stable
   	cargo test --frozen --all-features
}

package() {
	cd Komac-${pkgver}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
