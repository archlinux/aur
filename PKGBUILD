# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=acceptarium-git
pkgver=0.0.0.r108.g5fbffcd
pkgrel=1
pkgdesc='CLI tool to facilitate digitized receipt handling in plain text accounting workflows'
arch=(x86_64)
url="https://codeberg.org/plaintextaccounting/${pkgname%-git}"
license=(AGPL-3.0-only)
depends=(git
         git-annex
         glibc # libc.so libm.so
         libgcc libgcc_s.so
         libgit2 libgit2.so
         zlib libz.so
         zsh)
makedepends=(cargo
             imagemagick
             ollama
             tesseract
             jq)
optdepends=('imagemagick: convert PDFs prior to OCR'
            'ollama: extract data from images or OCR using local models'
            'tesseract: process using OCR')
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
	export LIBGIT2_NO_VENDOR=1
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	./configure --prefix="/usr" --with-imagemagick --with-ollama --with-tesseract
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
