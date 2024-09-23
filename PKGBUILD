# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship-git
pkgver=0.10.0.r0.g72bb07c
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=(x86_64)
url="https://github.com/theleagueof/${pkgname%-git}"
license=(GPL-3.0-only)
depends=(diffutils
         entr
         font-v
         gftools
         git
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
	./bootstrap.sh
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "${pkgname%-git}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export LIBGIT2_SYS_USE_PKG_CONFIG=1
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
