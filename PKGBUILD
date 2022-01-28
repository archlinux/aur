# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_pkgname=sile
pkgname=$_pkgname-luajit
pkgdesc='The SILE Typesetter, a modern typesetting system inspired by LaTeX, customizable in Lua'
pkgver=0.12.2
pkgrel=1
arch=(x86_64)
url=https://www.sile-typesetter.org
license=(MIT)
_luadeps=(bit32
          cassowary
          cliargs
          compat53 # Not needed for Lua 5.3+, LuaJIT is 5.1(ish)
          cosmo
          expat
          filesystem
          linenoise
          lpeg
          luaepnf
          luarepl
          luautf8
          penlight
          sec
          socket
          stdlib
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
optdepends=('libertinus-font: math package default font')
checkdepends=(poppler)
provides=(libtexpdf.so
          "$_pkgname=$pkgver")
conflicts=("$_pkgname")
_archive="$_pkgname-$pkgver"
source=("https://github.com/sile-typesetter/sile/releases/download/v$pkgver/$_archive.tar.xz")
sha256sums=('510367f0f55f3770d530219f8eca602d0b6b9abf82de83492cb0c85c1f599646')

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
