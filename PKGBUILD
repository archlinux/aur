# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=sile
pkgname=$_pkgname-luajit-git
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.14.6.r0.g9893755
pkgrel=1
arch=(x86_64)
url=https://www.sile-typesetter.org
_url="https://github.com/sile-typesetter/$_pkgname"
license=(MIT)
_luadeps=(cassowary
          cldr
          cliargs
          compat53 # Not needed for Lua 5.3+, LuaJIT is 5.1(ish)
          cosmo
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
         luajit
         "${_luadeps[@]/#/lua51-}"
         zlib)
depends+=(libfreetype.so
          libharfbuzz.so
          libicudata.so
          libicui18n.so
          libicuio.so
          libicuuc.so)
optdepends=('libertinus-font: default math font'
            'luarocks: manage addon packages'
            'noto-fonts-cjk: default font for tate enabled classes'
            'ttf-hack: defaualt mono font')
checkdepends=(poppler)
provides=(libtexpdf.so
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(debug)
source=("git+$_url.git"
        "git+${_url%/$_pkgname}/libtexpdf.git")
sha256sums=('SKIP'
            'SKIP')

prepare () {
	cd "$_pkgname"
	git submodule init
	git config submodule.libtexpdf.url "$srcdir/libtexpdf"
	git -c protocol.file.allow=always submodule update
	./bootstrap.sh
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$_pkgname"
	./configure \
		--prefix /usr \
		--docdir /usr/share/doc/$pkgname \
		--with-luajit \
		--with-system-luarocks
	make all
}

check () {
	cd "$_pkgname"
	make check
}

package () {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir"
	mv "$pkgdir/usr/share/licenses/"{$_pkgname,$pkgname}
}
