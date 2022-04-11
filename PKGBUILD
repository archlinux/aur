# Maintainer: Sandelinos
pkgname='freej2me-git'
pkgver='r208.a32e5b2'
pkgrel=1
pkgdesc='A free J2ME emulator with libretro, awt and sdl2 frontends.'
arch=('any')
url='https://github.com/hex007/freej2me'
license=('GPL3' 'custom')
groups=()
depends=('java-runtime')
makedepends=('git' 'ant')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/hex007/freej2me' "${pkgname%-git}.patch" 'freej2me.sh' 'freej2me-sdl.sh' 'freej2me.desktop')
noextract=()
md5sums=('SKIP' 'ca9bfb86b778eaf6f8a39db34260a2fd' '023f95105f1d778373c54b8e907cee31' '82d53e26cd43b9f23687d9e54c7c3615' '96aafeee35968aa0950cc56a7a9ef459')

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	patch -p1 -i "${srcdir}/${pkgname%-git}.patch"
}

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	ant
	cd src/sdl2
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 build/freej2me.jar "${pkgdir}/usr/share/java/freej2me/freej2me.jar"
	install -Dm644 build/freej2me-lr.jar "${pkgdir}/usr/share/java/freej2me/freej2me-lr.jar"
	install -Dm644 build/freej2me-sdl.jar "${pkgdir}/usr/share/java/freej2me/freej2me-sdl.jar"
	install -Dm755 src/sdl2/sdl_interface "${pkgdir}/usr/bin/sdl_interface"
	install -Dm755 "${srcdir}/freej2me.sh" "${pkgdir}/usr/bin/freej2me"
	install -Dm755 "${srcdir}/freej2me-sdl.sh" "${pkgdir}/usr/bin/freej2me-sdl"
	install -Dm644 resources/org/recompile/icon.png "${pkgdir}/usr/share/pixmaps/freej2me.png"
	install -Dm644 "${srcdir}/freej2me.desktop" "${pkgdir}/usr/share/applications/freej2me.desktop"
}
