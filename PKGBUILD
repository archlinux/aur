# Maintainer: Popolon < popolon àt popolon.org >

_pkgname=raylib-lua-sol
pkgname=${_pkgname}-git
pkgver=r60.dd02dd2
pkgrel=2
pkgdesc="A simple and easy-to-use raylib based Lua library to enjoy videogames programming."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'powerpc' 'loong64' 'powerpc64le' 'powerpc64')
url="http://www.raylib.com/"
license=('zlib/libpng')
depends=('alsa-lib' 'mesa' 'libx11' 'libxrandr' 'libxi' 'xorg-server' 'xorgproto' 'glu' )
makedepends=('cmake')
provides=("raylib-lua-sol")
conflicts=("raylib-lua-sol")
source=("git+https://github.com/RobLoach/${_pkgname}"
	'lua_use_posix_no_com_52.patch'
        'sol2_stdexcept.patch')
sha256sums=('SKIP'
            '31936b45bacb73aabdeed301e29082e410e0a0f0358044931ddd4a70210fe2cb'
            '1e3ca28374578018579496e4d94fe315d49aab698f65ec0fe15ddc9634392b00')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init
	patch -p1 -i ../lua_use_posix_no_com_52.patch
        cd vendor/sol2
        patch -p1 -i ../../../sol2_stdexcept.patch
        cd ../lua
        git checkout v5.4
        cd ../../
	cmake -B build .
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake --build build --config Release
}

package() {
	cd "${srcdir}/${_pkgname}"
#	DESTDIR="${pkgdir}" cmake --install build
	install -Dm755 build/bin/raylib-lua-sol -t ${pkgdir}/usr/bin/
	install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${_pkgname}/
}

