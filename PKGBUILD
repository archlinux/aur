# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
_pkgname=beans-rs
pkgver=1.5.2
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('40018a04af6b7a7e3916417bb24af7948f72c176ac506f46bf0441a192ee50cc')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=nightly
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
