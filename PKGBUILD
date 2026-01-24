# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Dvd-Znf <email@dvdznf.xyz>

pkgname=komac
pkgver=2.15.0
pkgrel=1
pkgdesc="The Community Manifest Creator for WinGet"
arch=('x86_64')
url="https://github.com/russellbanks/Komac"
license=('GPL-3.0-or-later')
depends=('bzip2' 'gcc-libs')
makedepends=('cargo')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c22ef89c9018a35b10de14c953616721864a86f2a6c4c83f4ceb95785cb8635d')

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
