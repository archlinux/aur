# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Based on aur/freej2me-git

pkgname='freej2me-plus-git'
pkgver=1.45.r884.349e165
pkgrel=1
pkgdesc='A free J2ME emulator with libretro, awt and sdl2 frontends.'
arch=('any')
url='https://github.com/TASEmulators/freej2me-plus'
license=('GPL-3.0-only' 'custom')
depends=('java-runtime')
makedepends=('git' 'ant')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}" 'freej2me-plus.sh' 'freej2me-plus-sdl.sh' 'freej2me-plus.desktop')
md5sums=('SKIP'
         'c63d23b3eee3f177363a19bf0b256ec9'
         'b525f5cd99122d5a15022912c8116cdf'
         '172dc3882f25b3b786bfba42f16b4048')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	_version=$(sed -n 's/.*final String VERSION = "\([^"]*\)";.*/\1/p' src/org/recompile/freej2me/AWTGUI.java)
	printf "%s.r%s.%s" ${_version} "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	ant
	cd src/libretro
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 build/freej2me.jar "${pkgdir}/usr/share/java/freej2me-plus/freej2me.jar"
	install -Dm644 build/freej2me-lr.jar "${pkgdir}/usr/share/java/freej2me-plus/freej2me-lr.jar"
	install -Dm644 build/freej2me-sdl.jar "${pkgdir}/usr/share/java/freej2me-plus/freej2me-sdl.jar"
	install -Dm755 "${srcdir}/freej2me-plus.sh" "${pkgdir}/usr/bin/freej2me-plus"
	install -Dm755 "${srcdir}/freej2me-plus-sdl.sh" "${pkgdir}/usr/bin/freej2me-plus-sdl"
	install -Dm644 resources/org/recompile/icon.png "${pkgdir}/usr/share/pixmaps/freej2me-plus.png"
	install -Dm644 "${srcdir}/freej2me-plus.desktop" "${pkgdir}/usr/share/applications/freej2me-plus.desktop"
}
