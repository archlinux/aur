# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=lib32-sdl12-compat-git
_pkgbase=sdl12-compat
pkgver=r520.d05899f
pkgrel=2
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64")
url="https://github.com/libsdl-org/sdl12-compat"
license=('custom')
depends=('lib32-sdl2' 'lib32-sdl-compat_image' 'lib32-glibc')
makedepends=('gcc' 'cmake' 'git')
conflicts=('lib32-sdl')
provides=('lib32-sdl')
source=("git+https://github.com/libsdl-org/sdl12-compat.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
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
}

package() {
	cd "$srcdir/$_pkgbase/build32"
	make DESTDIR="$pkgdir/" install

	cd "$pkgdir/usr/"
	rm -rf share/ bin/ include/

	mkdir -p "$pkgdir/usr/share/licenses/lib32-sdl12-compat"
	cp "$srcdir/$_pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/lib32-sdl12-compat/LICENSE.txt"
}
