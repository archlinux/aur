# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=openglad-git
pkgver=r935.e39b7ef
pkgrel=1
pkgdesc="SDL port of the hack-n-slash DOS game Gladiator"
arch=('i686' 'x86_64')
url="https://github.com/openglad/openglad"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng')
makedepends=('premake')
source=("$pkgname::git+https://github.com/openglad/openglad.git" 'get_asset_path.patch')
sha512sums=('SKIP' 'f7622ccd389ad9ad4c57967ac7d9e3fc758e3291ee1d38ea3cebc4d857a6e7b71fbab28a97488b8e2a7da7047f50b1fb949e0536046ad155cf62c52ea948b320')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	# hard-code /usr/share/openglad as asset path
	patch --strip=1 --input=../get_asset_path.patch

	# remove SDL2main lib
	sed -i -- 's/"SDL2main", //g' premake4.lua
}

build() {
	cd "$srcdir/$pkgname"
	premake5 --includedirs=/usr/include/SDL2 gmake
	make config=release
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 bin/Release/openglad "$pkgdir/usr/bin/openglad"

	install -d "$pkgdir/usr/share/openglad"
	cp -dr --no-preserve=ownership {pix,sound,cfg,builtin} "$pkgdir/usr/share/openglad"
}
