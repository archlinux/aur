# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=principia-git
pkgver=r115.3b6d2bd
pkgrel=1
pkgdesc="Physics-based sandbox building game."
url='https://github.com/Bithack/principia/'
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk2' 'curl' 'libpng' 'libjpeg' 'freetype2' 'sdl2' 'sdl2_gfx' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
makedepends=()
source=('git+https://github.com/Bithack/principia')
sha256sums=(SKIP)
options=()

pkgver() {
	cd principia
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd principia/build-linux
	./autogen.sh
	./configure
	./go --clean --release --silent
}

package() {
	cd principia/build-linux
	install -Dm755 "principia" "${pkgdir}/opt/principia/principia"
	install -d "${pkgdir}/usr/bin/"
	ln -s /opt/principia/principia "${pkgdir}/usr/bin/principia"
	
	install -Dm644 "principia.desktop" "${pkgdir}/usr/share/applications/principia.desktop"
	install -Dm644 "principia-url-handler.desktop" "${pkgdir}/usr/share/applications/principia-url-handler.desktop"
	
	install -Dm644 "principia.png" "${pkgdir}/usr/share/pixmaps/principia.png"

	install -d "${pkgdir}/opt"
	cp -r ../data-{shared,pc} "${pkgdir}/opt/principia/"
}
