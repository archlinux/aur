# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

_lua_version=5.2
_lua_name=hpdf
_git_rev=d8c93345d87a96135739017566d98b02774f558a

pkgname=lua-${_lua_name}
pkgver=2.3.0
pkgrel=3
pkgdesc='Programmatically create PDF files using Lua.'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='http://luahpdf.colloquiki.com/'
license=('MIT')
depends=('lua' 'libharu')
source=(
	${pkgname}-${_git_rev}.tar.gz::"https://github.com/jung-kurt/luahpdf/archive/${_git_rev}.tar.gz"
	'lua54.patch'
)
sha256sums=(
	'6eb8c6392bcc76d85d851004d702f3cbf00f485661706ad64ec7d91d5519a925'
	'8b830ef6c397f8f83294989e2dd9bdd748e0c95580a85c22a09b8b8b228add44'
)

prepare() {
	cd "${srcdir}/lua${_lua_name}-${_git_rev}"
	patch -p1 -i ../lua54.patch
}

build() {
	cd "${srcdir}/lua${_lua_name}-${_git_rev}"
	LUALIB="-llua" LUAINC="" make
}

_extract_string_define() {
	sed -n "s/#define[ 	]\\+${1}[j	]\\+\"\\(.*\\)\"/\\1/p" "${2}"
}

package() {
	cd "${srcdir}/lua${_lua_name}-${_git_rev}"
	MAJOR="$(_extract_string_define LUA_VERSION_MAJOR /usr/include/lua.h)"
	MINOR="$(_extract_string_define LUA_VERSION_MINOR /usr/include/lua.h)"
	[ "${MAJOR}" -a "${MINOR}" ] || exit 1
	PREFIX="/usr" DESTDIR="${pkgdir}" MODDIR="/usr/lib/lua/${MAJOR}.${MINOR}" make install
}
