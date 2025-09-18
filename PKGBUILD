# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans
_pkgname=beans-rs
pkgver=1.7.3
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "cairo" "pango" "libxcursor" "libxfixes" "libxinerama" "glib2" "libx11")
makedepends=("cargo-nightly")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e82c1be815d68b79ff8d82e8f380cdd143329cd2ea193f58b086a980cbd426d8'
            '8b51d3482aa4750dd51d6bbdc4c2905c7e281c0b280da989c000dd371109dea4')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=stable
	export RUSTUP_HOME="$srcdir/.rustup"
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	#export RUSTUP_TOOLCHAIN=stable
	export RUSTUP_HOME="$srcdir/.rustup"
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/$pkgname"
}
