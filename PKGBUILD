# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=acceptarium-git
pkgver=0.0.0.r252.g84417eb
pkgrel=1
pkgdesc='CLI tool to facilitate digitized receipt handling in plain text accounting workflows'
arch=(x86_64)
url="https://codeberg.org/plaintextaccounting/${pkgname%-git}"
license=(AGPL-3.0-only)
depends=(git
         git-annex
         glibc # libc.so libm.so
         chafa libchafa.so
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

_srcenv() {
	cd "${pkgname%-git}"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -fno-lto'
	export CARGO_FEATURE_FLAGS==--offline
	export LIBGIT2_NO_VENDOR=1
}

prepare() {
	_srcenv
	sed Makefile.am -i -e "/^licensedir = /s#.(_acceptarium)\$#$pkgname#"
	./bootstrap.sh
	cargo fetch --locked --target host-tuple
}

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
