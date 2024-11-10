# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans-git
pkgver=1.3.1.r260.g7588aab
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl")
makedepends=("cargo-nightly")
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
source=("$pkgname::git+$url.git#branch=develop"
	"fltk.patch")
sha256sums=('SKIP'
            '8b51d3482aa4750dd51d6bbdc4c2905c7e281c0b280da989c000dd371109dea4')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 < "$srcdir/fltk.patch"
	#export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	#export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/${pkgname::-4}"
}
