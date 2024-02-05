# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='lua-archive-git'
pkgdesc='Lua module to manipulate compressed file formats via libarchive'
pkgver=0.r5.gbc0929b
pkgrel=1
# NOTE: We use Bastien Nocera's fork, which supports Lua 5.1+
url='https://github.com/hadess/lua-archive'
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('lua' 'libarchive')
makedepends=('cmake' 'make' 'git')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^version\.//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	# Workaround usage of luaL_register(), whih disappeared in Lua 5.2
	CFLAGS="${CFLAGS} -D'luaL_register(L,_,r)=(luaL_setfuncs((L),(r),0))'"

	# CMake is stupid and *does not* add the $CFLAGS from the environment to
	# its own, so we have to add back all the flags that it might have been
	# using to build a dynamic library. SRLSY, CMake?
	CFLAGS="${CFLAGS} -fPIC -ggdb"

	cd "${pkgname}"
	CFLAGS="${CFLAGS}" cmake -G 'Unix Makefiles' .
	make
}

# TODO: Check why this fails with a SIGSEGV.
# check () {
# 	cd "${pkgname}"
# 	lua test.lua "$(pwd)" "$(pwd)"
# }

package () {
	cd "${pkgname}"
	install -Dm755 archive.so "${pkgdir}/usr/lib/lua/5.3/archive.so"
	install -Dm644 README "${pkgdir}/usr/share/licenses/${pkgname}/README"
}
