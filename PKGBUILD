# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=casile
pkgver=0.7.4
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=(x86_64)
url="https://github.com/sile-typesetter/$pkgname"
license=(AGPL3)
depends=(bc
         bcprov # pdftk optdepend is required
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
         xorg-server-xvfb
         yq
         zint
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
depends+=("${_lua_deps[@]/#/lua-}" "${_lua_deps[@]/#/lua53-}"
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
sha256sums=('18475a27803f725e73071e06dab72511695346586888e940a516598d4097892c')

prepare() {
	cd "$_archive"
	sed Makefile.am -i \
		-e 's/yarn \(install\|run\)/yarn --offline \1/' \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	autoreconf
	cargo fetch --locked  --target "$CARCH-unknown-linux-gnu"
	local YARN_CACHE_FOLDER="$srcdir/node_modules"
	yarn install --production --frozen-lockfile
}

build() {
    cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	local CARGO_TARGET_DIR=target
	local YARN_CACHE_FOLDER="$srcdir/node_modules"
	./configure --prefix "/usr"
	make
}

check() {
	cd "$_archive"
	local RUSTUP_TOOLCHAIN=stable
	make check
}

package () {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	node-prune "$pkgdir/usr/share/casile/node_modules"
}
