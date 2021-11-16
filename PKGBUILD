# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=('sdl12-compat-git' 'lib32-sdl12-compat-git')
pkgbase=sdl12-compat
_pkgbase=sdl12-compat
pkgver=r474.16305a1
pkgrel=1
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64" "x86_64")
url="https://github.com/libsdl-org/sdl12-compat"
license=('custom')
depends=('sdl2' 'glibc' 'sdl-compat_image')
makedepends=('sdl2' 'gcc' 'cmake' 'git' 'lib32-gcc-libs' 'lib32-sdl2' 'sdl-compat-image' 'lib32-sdl-compat_image')
optdepends=()
conflicts=('sdl')
provides=('sdl')
source=("git+https://github.com/libsdl-org/sdl12-compat.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	mkdir "$srcdir/$_pkgbase/build64"
	mkdir "$srcdir/$_pkgbase/build32"

}

build() {
	cd "$srcdir/$_pkgbase/build32"

	cmake ../ \
	-DCMAKE_C_FLAGS="$CFLAGS -m32" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib32" \
	-DSDL12TESTS=0 \
	-DSDL12DEVEL=1
	make

	cd "$srcdir/$_pkgbase/build64"

	cmake ../ \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DSDL12TESTS=0 \
	-DSDL12DEVEL=1
	make

}

package_lib32-sdl12-compat-git() {
	depends=('lib32-sdl2' 'lib32-glibc' 'lib32-sdl-compat_image')
	conflicts=('lib32-sdl')
	provides=('lib32-sdl')

	cd "$srcdir/$_pkgbase/build32"
	make DESTDIR="$pkgdir/" install

	cd "$pkgdir/usr/"
	rm -rf share/ bin/ include/

	mkdir -p "$pkgdir/usr/share/licenses/lib32-sdl12-compat"
	cp "$srcdir/$_pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/lib32-sdl12-compat/LICENSE.txt"
}


package_sdl12-compat-git() {
	cd "$srcdir/$_pkgbase/build64"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share/licenses/sdl12-compat"
	cp "$srcdir/$_pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/sdl12-compat/LICENSE.txt"
}
