# Maintainer: LIN Ruohshoei <20455421+LinRs [dot] users.noreply.github.com>

pkgname=devilutionx-git
pkgver=r1066.be85b3f
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:The Unlicense')
depends=('sdl2_mixer')
makedepends=('git' 'cmake' 'gcovr' 'lib32-gcc-libs' 'lib32-sdl2_mixer' 'nasm') 
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=(
  ${pkgname}::git+https://github.com/diasurgical/devilutionX.git
  LICENSE::https://raw.githubusercontent.com/diasurgical/devilutionX/master/LICENSE
       )
noextract=()
sha256sums=('SKIP'
            '88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd')
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/${pkgname}"
	mkdir -p build && cd build
	export SDL2_LIBRARIES="-L${SDL2_LIBDIR} -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf"
	export CFLAGS="$CFLAGS -O0 -fbuiltin -g"
	export CXXFLAGS="$CXXFLAGS -O0 -fbuiltin -g"
	cmake .. \
	  -DCMAKE_INSTALL_PREFIX=/usr 
	make devilution
}
package() {
	cd "$srcdir/${pkgname}"
	install -vDm755 build/devilution "${pkgdir}/usr/bin/devilution" 
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
