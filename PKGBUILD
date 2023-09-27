# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=sile
pkgname=$_pkgname-git
pkgdesc='The SILE Typesetter, a modern typesetting system inspired by LaTeX, customizable in Lua'
pkgver=0.14.11.r110.gc2fc190
pkgrel=1
arch=(x86_64)
url=https://www.sile-typesetter.org
_url="https://github.com/sile-typesetter/$_pkgname"
license=(MIT)
_luadeps=(cassowary
          cldr
          cliargs
          compat53 # Not needed for Lua 5.3+, LuaJIT is 5.1(ish)
          expat
          filesystem
          fluent
          linenoise
          loadkit
          lpeg
          luaepnf
          luarepl
          luautf8
          penlight
          sec
          socket
          vstruct
          zlib)
depends=(glibc
         fontconfig
         freetype2
         harfbuzz
         gentium-plus-font
         git
         icu
         libpng # this goes with libtexpdf if ever split out to a library package
         "${_luadeps[@]/#/lua51-}"
         zlib)
depends+=(libfreetype.so
          libharfbuzz.so
          libharfbuzz-subset.so
          libicudata.so
          libicui18n.so
          libicuio.so
          libicuuc.so)
optdepends=('libertinus-font: default math font'
            'luarocks: manage addon packages'
            'noto-fonts-cjk: default font for tate enabled classes'
            'ttf-hack: default mono font')
makedepends=(cargo
             luajit
             jq)
checkdepends=(poppler)
provides=(libtexpdf.so
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=("$_pkgname-luajit-git")
source=("git+$_url.git#branch=develop"
        "git+${_url%/$_pkgname}/libtexpdf.git")
sha256sums=('SKIP'
            'SKIP')

prepare () {
	cd "$_pkgname"
	git submodule init
	git config submodule.libtexpdf.url "$srcdir/libtexpdf"
	git -c protocol.file.allow=always submodule update
	sed Makefile.am -i \
		-e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
	./bootstrap.sh
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build () {
	_srcenv
	./configure \
		--prefix /usr \
		--docdir /usr/share/doc/$pkgname \
		--with-system-luarocks
	make all
}

check () {
	_srcenv
	make check
}

package () {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir"
	mv "$pkgdir/usr/share/licenses/"{$_pkgname,$pkgname}
}
