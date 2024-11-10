# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
_pkgname=beans-rs
pkgver=1.6.0
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl" "cairo" "pango" "libxcursor" "libxfixes" "libxinerama" "glib2" "libx11")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
	"fltk.patch")
sha256sums=('d68ad56e893da97a76cddf65475401105b285410d32ba636496e20c4d5ff2e1e'
            '8b51d3482aa4750dd51d6bbdc4c2905c7e281c0b280da989c000dd371109dea4')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=nightly
	patch -p1 < "$srcdir/fltk.patch"
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/$pkgname"
}
