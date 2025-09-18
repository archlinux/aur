# Maintainer: HurricanePootis <hurricanepootis@protonamil.com>
pkgname=ofinstaller-beans-git
pkgver=1.3.1.r313.g471281f
pkgrel=1
pkgdesc=" Installer for Open Fortress "
arch=('x86_64')
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
depends=("glibc" "gcc-libs" "glib2" "cairo" "libxinerama" "libxfixes" "pango" "libxcursor" "libx11")
makedepends=("cargo-nightly")
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
source=("$pkgname::git+$url.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	export RUSTUP_HOME="$srcdir/.rustup"
	#export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
	#export RUSTUP_TOOLCHAIN=nightly
	export RUSTUP_HOME="$srcdir/.rustup"
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname/target/release"
	install -Dm755 beans-rs "$pkgdir/usr/bin/${pkgname::-4}"
}
