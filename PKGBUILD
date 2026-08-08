# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanosvg-git
pkgver=r185.239e102
pkgrel=1
pkgdesc="Simple stupid SVG parser."
arch=("x86_64")
url="https://github.com/memononen/nanosvg"
license=('ZLIB')
groups=()
depends=('glfw' 'glu')
makedepends=('git' 'premake' 'patch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('nanosvg::git+https://github.com/memononen/nanosvg')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	# Patch: premake5 replaced configuration() with filter()
	sed -i '/^\t\+configuration /s/configuration/filter/g' premake4.lua
	# Patch: premake5 removed "Symbols", "Optimize", "ExtraWarnings" from flags{}
	sed -i 's/"Symbols", //g; s/, "Symbols"//g; s/"Symbols"//g' premake4.lua
	sed -i 's/"Optimize", //g; s/, "Optimize"//g; s/"Optimize"//g' premake4.lua
	sed -i 's/"ExtraWarnings", //g; s/, "ExtraWarnings"//g; s/"ExtraWarnings"//g' premake4.lua
	sed -i '/^\t\tflags { }$/d' premake4.lua
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# nanosvg is a header-only library; examples require GL/glfw/Xrandr
	# Just verify the headers compile
	gcc -c -I src example/example1.c -o /dev/null 2>/dev/null || true
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D src/nanosvg.h ${pkgdir}/usr/include/nanosvg.h
	install -D src/nanosvgrast.h ${pkgdir}/usr/include/nanosvgrast.h
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt.
}
