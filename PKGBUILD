# Maintainer: Oliver Weissbarth <mail@oweissbarth.de>
pkgname=nanovg-git
pkgver=r394.e628d62
pkgrel=1
pkgdesc="NanoVG is small antialiased vector graphics rendering library for OpenGL."
arch=("x86_64")
url="https://github.com/memononen/nanovg"
license=('ZLIB')
groups=()
depends=()
makedepends=('git' 'premake' 'patch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=('nanovg::git+https://github.com/memononen/nanovg'
	'disable_examples.patch')
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	patch premake4.lua < "$startdir/disable_examples.patch"
	premake5 gmake
	cd build
	make config=release_native
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D build/libnanovg.a ${pkgdir}/usr/lib/libnanovg.a
	install -D src/nanovg.h ${pkgdir}/usr/include/nanovg.h
	install -D src/nanovg_gl.h ${pkgdir}/usr/include/nanovg_gl.h
	install -D src/fontstash.h ${pkgdir}/usr/include/fontstash.h
	install -D src/nanovg_gl_utils.h ${pkgdir}/usr/include/nanovg_gl_utils.h
	install -D src/stb_image.h ${pkgdir}/usr/include/stb_image.h
	install -D src/stb_truetype.h ${pkgdir}/usr/include/stb_truetype.h
	install -D LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt.
}
