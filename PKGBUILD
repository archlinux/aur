# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
pkgver=1.3.1
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/AdastralGroup/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "openssl")
makedepends=("rust-nightly-bin")
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('ef568d255802413d32610330670387169137e3407d9f01262a114588d9c5005e')

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/$pkgname"
}
