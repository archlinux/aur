# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.10.1.r0.g33e5261
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=(x86_64)
url="https://github.com/theleagueof/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(diffutils
         entr
         font-v
         gcc-libs # libgcc_s.so
         gftools
         git
         glibc # libc.so libm.so
         jq
         libarchive
         libgit2
         make
         psautohint
         python
         python-babelfont
         python-brotli # fonttools optdepends
         python-cffsubr # ufo2ft optdepends
         python-fontmake
         python-fonttools
         python-fs # fonttools optdepends
         python-lxml # fonttools optdepends
         python-pcpp
         python-skia-pathops # ufo2ft optdepends
         python-ufo2ft
         python-ufonormalizer
         python-unicodedata2 # fonttools optdepends
         python-vttlib
         python-zopfli # fonttools optdepends
         sfd2ufo
         sfdnormalize
         sfnt2woff-zopfli
         ttfautohint
         woff2
         zsh)
makedepends=(cargo)
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
	sed Makefile.am -i -e "/^licensedir = /s#.(_casile)\$#$pkgname#"
	./bootstrap.sh
	cargo fetch --locked --target "$(rustc --print host-tuple)"
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
	./configure --prefix="/usr"
	make
}

check() {
	_srcenv
	make check
}

package() {
	depends+=(libgit2.so)
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
