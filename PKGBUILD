# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgver=0.7.4.r14.g838eb6f
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=(x86_64)
url="https://github.com/sile-typesetter/${pkgname%-git}"
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
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	sed Makefile.am -i \
		-e "/^licensedir = /s#.(_casile)\$#$pkgname#" \
		-e 's/yarn \(install\|run\)/yarn --offline \1/' \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	./bootstrap.sh
	cargo fetch --locked  --target "$CARCH-unknown-linux-gnu"
	export YARN_CACHE_FOLDER="$srcdir/node_modules"
	yarn install --production --frozen-lockfile
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export YARN_CACHE_FOLDER="$srcdir/node_modules"
	./configure --prefix "/usr"
	make
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	make check
}

package () {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	node-prune "$pkgdir/usr/share/casile/node_modules"
}
