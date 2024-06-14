# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
_pkgname=beans-rs
pkgver=1.4.3
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
	"nightly.patch::$url/commit/fd653569f147d2e7bef78ea1eabab072e7dbcc1f.patch")
sha256sums=('1f4ce3c7a38cede39366aacddc48540cfcd8ce66ac61b929b8be592bcaf60c1c'
            'd2864ebc5dcd070aa31e0ab5c7cd3f45b6793877ec761b74427761e69f15e5ab')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=nightly
	patch -p1 < "$srcdir/nightly.patch"
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
