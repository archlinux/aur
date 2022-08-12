# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=casile
pkgver=0.10.2
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=(x86_64)
url="https://github.com/sile-typesetter/$pkgname"
license=(AGPL3)
depends=(bc
         bcprov # pdftk optdepend is required
         curl
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
         m4
         make
         mdbook
         moreutils
         nodejs
         pandoc-sile-git
         pcre
         pdftk
         perl
         podofo
         poppler
         povray
         procps-ng
         python
         sile
         sqlite
         tex-gyre-fonts
         texlive-core
         ttf-hack
         xcftools
         xorg-server-xvfb
         yq
         zint
         zola
         zsh)
_lua_deps=(colors-git
           filesystem
           yaml)
_perl_deps=(yaml
            yaml-merge-simple)
_python_deps=(isbnlib
              pandocfilters
              pantable
              ruamel-yaml
              usfm2osis-cw-git)
depends+=("${_lua_deps[@]/#/lua-}"
          "${_perl_deps[@]/#/perl-}"
          "${_python_deps[@]/#/python-}")
depends+=(libgit2.so)
makedepends=(autoconf-archive
             cargo
             luarocks
             node-prune
             yarn)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('e17e9d32d6c14638c1e1cc254d417040e5d86fbdf67c4ba6cff3c6d6a377b5c1')

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
