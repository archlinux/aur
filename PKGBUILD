# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=sdl12-compat-git
_pkgbase=sdl12-compat
pkgver=r520.d05899f
pkgrel=2
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=("x86_64")
url="https://github.com/libsdl-org/sdl12-compat"
license=('custom')
depends=('sdl-compat_image' 'sdl2' 'glibc')
makedepends=('cmake' 'git')
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
