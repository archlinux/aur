# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.10.1
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=(any)
url="https://github.com/theleagueof/$pkgname"
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
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.zst"{,.asc})
sha256sums=('e6f17e873528d590fae39ba06c8d4007b19b5356de3b81bd60096eb33921e634'
            'SKIP')
validpgpkeys=('9F377DDB6D3153A48EB3EB1E63CC496475267693') # Caleb Maclennan <caleb@alerque.com> (@alerque)

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
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
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
