# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ctrdecrypt-git
pkgver=1.1.0.r17.g025d440
pkgrel=1
pkgdesc="Decrypt module for cia-unix"
arch=('x86_64' 'aarch64')
url="https://github.com/shijimasoft/ctrdecrypt"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo' 'git')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("${pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}


prepare() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 target/release/${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
}
