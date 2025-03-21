# Maintainer: Dvd-Znf <email@dvdznf.xyz>

pkgname=komac
pkgver=2.11.1
pkgrel=1
pkgdesc="The Community Manifest Creator for WinGet"
arch=('x86_64')
url="https://github.com/russellbanks/Komac"
license=('GPL-3.0-or-later')
depends=('bzip2' 'gcc-libs')
makedepends=('cargo')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("7dd393fdbefcdea4d6d59dbe62bd4f94541b5674d5d2924c84d494783d281a76")

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
