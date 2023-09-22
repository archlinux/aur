# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=casile
pkgver=0.11.3
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=(x86_64)
url="https://github.com/sile-typesetter/$pkgname"
license=(AGPL3)
depends=(bc
         bcprov # pdftk optdepend is required
         curl
         decasify
         entr
         epubcheck
         fontconfig
         ghostscript
         git
         git-warp-time
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
         pcre
         pdftk
         perl
         podofo-tools
         poppler
         povray
         procps-ng
         python
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
_lua_deps=(colors-git
           decasify
           filesystem
           yaml)
_perl_deps=(yaml
            yaml-merge-simple)
_python_deps=(isbnlib
              deepl
              pandocfilters
              pantable
              ruamel-yaml
              usfm2osis-cw-git)
depends+=("${_lua_deps[@]/#/lua-}"
          "${_lua_deps[@]/#/lua51-}"
          "${_perl_deps[@]/#/perl-}"
          "${_python_deps[@]/#/python-}")
depends+=(gcc-libs
          glibc)
depends+=(libgit2.so)
makedepends=(autoconf-archive
             cargo
             node-prune
             yarn)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('cdfac2771a0f9315f57fb2c9cc27c182ed74543caa8543ad504b5862e286669e')

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/yarn \(install\|run\)/yarn --offline \1/' \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked  --target "$CARCH-unknown-linux-gnu"
	export YARN_CACHE_FOLDER="$srcdir/node_modules"
	yarn install --production --frozen-lockfile
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export YARN_CACHE_FOLDER="$srcdir/node_modules"
	./configure --prefix "/usr"
	make
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	make check
}

package () {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	node-prune "$pkgdir/usr/share/casile/node_modules"
}
