# Maintainer: ROllerozxa <rollerozxa@voxelmanip.se>
pkgname=principia-git
pkgver=r27.b5f86f0
pkgrel=1
pkgdesc="Physics-based sandbox building game."
arch=('x86_64' 'i686')
license=('bsd-3')
depends=('gtk2')
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
	install -Dm755 "apparatus2" "${pkgdir}/opt/principia/principia"
	install -d "${pkgdir}/usr/bin/"
	ln -s /opt/principia/principia "${pkgdir}/usr/bin/"
	
	install -Dm644 "principia.desktop" "${pkgdir}/usr/share/applications/principia.desktop"
	install -Dm644 "principia-url-handler.desktop" "${pkgdir}/usr/share/applications/principia-url-handler.desktop"
	
	install -Dm644 "principia.png" "${pkgdir}/usr/share/pixmaps/principia.png"

	install -d "${pkgdir}/opt"
	cp -r ../data-{shared,pc} "${pkgdir}/opt/principia/"
}
