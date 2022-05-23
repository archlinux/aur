# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=sdl12-compat-git
_pkgbase=sdl12-compat
pkgver=1.2.52.r33.g9403529
pkgrel=1
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64")
url="https://github.com/libsdl-org/sdl12-compat"
license=('custom')
depends=('sdl2' 'glibc' 'glu')
makedepends=('cmake' 'git')
conflicts=('sdl' 'sdl12-compat')
provides=('sdl=1:1.2.15+r406+gf1caf909-1' 'sdl12-compat')
replaces=('sdl<1:1.2.15+r406+gf1caf909')
source=("git+https://github.com/libsdl-org/sdl12-compat.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	if test -e "$srcdir/$_pkgbase/build64"
	then
		:
	else
	mkdir "$srcdir/$_pkgbase/build64"
	fi
}

build() {
	cd "$srcdir/$_pkgbase/build64"

	cmake ../ \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DSDL12TESTS=0 \
	-DSDL12DEVEL=1
	make

}

package() {
	cd "$srcdir/$_pkgbase/build64"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share/licenses/sdl12-compat"
	cp "$srcdir/$_pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/sdl12-compat/LICENSE.txt"
}
