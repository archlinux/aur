# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=acceptarium-git
pkgver=0.0.0.r69.ge236535
pkgrel=1
pkgdesc='CLI tool to facilitate digitized receipt handling in plain text accounting workflows'
arch=(x86_64)
url="https://codeberg.org/plaintextaccounting/${pkgname%-git}"
license=(AGPL-3.0-only)
depends=(gcc-libs # libgcc_s.so
         git
         git-annex
         glibc # libc.so libm.so
         zlib libz.so
         zsh)
makedepends=(cargo
             jq)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	sed Makefile.am -i -e "/^licensedir = /s#.(_acceptarium)\$#$pkgname#"
	./bootstrap.sh
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_FEATURE_FLAGS==--offline
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	./configure --prefix="/usr"
	make
}

check() {
	_srcenv
	make check
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
