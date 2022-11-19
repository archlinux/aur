# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=sile
pkgname=$_pkgname-luajit
pkgdesc='The SILE Typesetter, a modern typesetting system inspired by LaTeX, customizable in Lua'
pkgver=0.14.5
pkgrel=1
arch=(x86_64)
url=https://www.sile-typesetter.org
_url="https://github.com/sile-typesetter/$_pkgname"
license=(MIT)
_luadeps=(bit32
          cassowary
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
            'noto-fonts-cjk: default font for tate enabled classes'
            'ttf-hack: defaualt mono font')
checkdepends=(poppler)
provides=(libtexpdf.so
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
_archive="$_pkgname-$pkgver"
source=("$_url/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('2f0d6bb49efdf38a44f322ccc7cdb5bb9c2207fdbb44f67aa362ea0963068e07')

build () {
	cd "$_archive"
	./configure \
		--prefix /usr \
		--with-luajit \
		--with-system-luarocks
	make all
}

check () {
	cd "$_archive"
	make check
}

package () {
	cd "$_archive"
	make install DESTDIR="$pkgdir"
	mv "$pkgdir/usr/share/licenses/"{$_pkgname,$pkgname}
}
