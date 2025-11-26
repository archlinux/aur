# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_branch=develop

_pkgname=sile
pkgname=$_pkgname-git
pkgdesc='a modern typesetting engine inspired by LaTeX, fully customizable in Lua'
pkgver=0.15.12.r55.g8cf80aa
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
depends=("${_luadeps[@]/#/lua51-}"
         fontconfig
         freetype2 libfreetype.so
         gentium-plus-font
         glibc
         harfbuzz libharfbuzz.so libharfbuzz-subset.so
         icu libicudata.so libicui18n.so libicuio.so libicuuc.so
         libpng libpng16.so # this goes with libtexpdf if ever split out to a library package
         luajit
         zlib libz.so)
optdepends=('otf-libertinus: default math font'
            'luarocks: manage addon packages'
            'noto-fonts-cjk: default font for tate enabled classes'
            'ttf-hack: default mono font')
makedepends=(cargo
             git
             jq
             luarocks)
checkdepends=(poppler)
provides=(libtexpdf.so
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=("$_pkgname-luajit-git")
source=("git+$_url.git#branch=$_branch"
        "git+${_url%/$_pkgname}/libtexpdf.git")
sha256sums=('SKIP'
            'SKIP')

prepare () {
	cd "$_pkgname"
	git submodule init
	git config submodule.libtexpdf.url "$srcdir/libtexpdf"
	git -c protocol.file.allow=always submodule update
	./bootstrap.sh
	cargo fetch --locked --target "$(rustc --print host-tuple)"
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
	export CARGO_FEATURE_FLAGS==--offline
}

build () {
	_srcenv
	./configure \
		--prefix /usr \
		--docdir /usr/share/doc/$pkgname \
		--disable-embeded-resources \
		--disable-static \
		--with-system-lua-sources \
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
