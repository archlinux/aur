# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgver=0.14.12.r31.g14aaaba
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=(x86_64)
url="https://github.com/sile-typesetter/${pkgname%-git}"
license=(AGPL-3.0-only)
depends=(bc
         bcprov # pdftk optdepend is required
         curl
         decasify
         entr
         epubcheck
         fontconfig
         gcc-libs # libgcc_s.so
         ghostscript
         git
         git-warp-time
         glibc # libc.so libm.so
         imagemagick
         inetutils
         inkscape
         java-commons-lang # pdftk optdepend is required
         jq
         kindlegen
         libertinus-font
         libgit2
         lua
         luarocks
         m4
         make
         mdbook
         moreutils
         nodejs
         pandoc-sile-git
         parallel
         pcre
         pdftk
         perl
         podofo-tools
         poppler
         povray
         procps-ng
         python
         ripgrep
         sassc
         sile
         sqlite
         tex-gyre-fonts
         texlive-basic
         texlive-binextra
         ttf-hack
         xcftools
         xorg-server-xvfb
         yq
         zint
         zola
         zsh)
_luadeps=(colors-git
          cosmo
          decasify
          filesystem
          yaml)
_perldeps=(yaml
           yaml-merge-simple)
_pydeps=(isbnlib
         deepl
         pandocfilters
         pantable
         ruamel-yaml
         usfm2osis-cw-git)
_siledeps=(decasify
           ptable)
depends+=("${_luadeps[@]/#/lua-}"
          "${_luadeps[@]/#/lua51-}"
          "${_perldeps[@]/#/perl-}"
          "${_pydeps[@]/#/python-}"
          "${_siledeps[@]/#/sile-}")
makedepends=(cargo
             node-prune
             yarn)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

_srcenv() {
	cd "$pkgname"
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
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	export LIBGIT2_NO_VENDOR=1
	export YARN_CACHE_FOLDER="$srcdir/node_modules"
}

prepare() {
	_srcenv
	sed Makefile.am -i \
		-e "/^licensedir = /s#.(_casile)\$#$pkgname#" \
		-e 's/yarn \(install\|run\)/yarn --offline \1/' \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	./bootstrap.sh
	cargo fetch --locked --target host-tuple
	yarn install --production --frozen-lockfile
}

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	_srcenv
	./configure --prefix "/usr"
	make
}

check() {
	_srcenv
	make check
}

package () {
	depends+=(libgit2.so)
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	node-prune "$pkgdir/usr/share/casile/node_modules"
}
