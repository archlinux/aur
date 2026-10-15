# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Dvd-Znf <email@dvdznf.xyz>

pkgname=komac
pkgver=2.17.1
pkgrel=1
pkgdesc="The Community Manifest Creator for WinGet"
arch=('x86_64')
url="https://github.com/russellbanks/Komac"
license=('GPL-3.0-or-later')
depends=('bzip2' 'gcc-libs' 'zlib')
makedepends=('cargo')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b87a4cec1c2dc8a334812d240c668692ab463f81ca58dc210b95f599f148b183')

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
	cargo test --frozen
}

package() {
	cd Komac-${pkgver}
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
