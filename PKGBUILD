# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=openglad-git
pkgver=r927.d74d6b1
pkgrel=1
pkgdesc="SDL port of the hack-n-slash DOS game Gladiator"
arch=('i686' 'x86_64')
url="http://www.openglad.org"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng')
makedepends=('premake4')
source=("$pkgname::git+https://github.com/openglad/openglad.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	# remove SDL2main lib
	sed -i -- 's/"SDL2main", //g' premake4.lua
}

build() {
	cd "$srcdir/$pkgname"
	premake4 --includedirs=/usr/include/SDL2 gmake
	make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 openglad "$pkgdir/usr/bin/openglad"

	install -d "$pkgdir/usr/share/openglad"
	cp -dr --no-preserve=ownership {pix,sound,cfg,builtin} "$pkgdir/usr/share/openglad"
}
