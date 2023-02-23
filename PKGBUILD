# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=lib32-sdl12-compat-git
_pkgbase=sdl12-compat
pkgver=1.2.60.r35.g0adf9aa
pkgrel=1
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64" "i686")
url="https://github.com/libsdl-org/sdl12-compat"
license=('custom')
depends=('lib32-sdl2' 'lib32-glibc' 'lib32-glu')
makedepends=('cmake' 'git')
conflicts=('lib32-sdl')
provides=('lib32-sdl=1.12.15')
conflicts=('lib32-sdl' 'lib32-sdl12-compat')
provides=('lib32-sdl=1:1.2.15+r406+gf1caf909-1' 'lib32-sdl12-compat')
source=("git+https://github.com/libsdl-org/sdl12-compat.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgbase"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^prerelease.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$srcdir"

	cmake -S $_pkgbase -B build \
	-DCMAKE_C_FLAGS="$CFLAGS -m32" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib32" \
	-DSDL12TESTS=0 \
	-DSDL12DEVEL=1
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build

	cd "$pkgdir/usr/"
	rm -rf share/ bin/ include/

	mkdir -p "$pkgdir/usr/share/licenses/lib32-sdl12-compat"
	cp "$srcdir/$_pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/lib32-sdl12-compat/LICENSE.txt"
}
