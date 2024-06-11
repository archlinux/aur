# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
_pkgname=beans-rs
pkgver=1.4.1
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/AdastralGroup/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl")
makedepends=("rust-nightly-bin")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c2c1687aad0bfe4d9f82bf1507c4818f22598a55921604f9e2125aa330c8021')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/$pkgname"
}
