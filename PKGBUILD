# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontship
pkgver=0.9.2
pkgrel=1
pkgdesc='A font development toolkit and collaborative work flow'
arch=(any)
url="https://github.com/theleagueof/$pkgname"
license=(AGPL-3.0-only)
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
         'python-ufo2ft>=2.19.1'
         python-ufonormalizer
         python-unicodedata2 # fonttools optdepends
         python-vttlib
         python-zopfli # fonttools optdepends
         'sfd2ufo>=1.0.7'
         sfdnormalize
         sfnt2woff-zopfli
         ttfautohint
         woff2
         zsh)
makedepends=(cargo
             rust)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.zst"{,.asc})
sha256sums=('b90eda42b19ff65e8968f61bf17c3d5f588e7325296995aa2d404c12f47f55ee'
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
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
