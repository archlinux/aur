# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Plaunarome <plaunarome@protonmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.4.2
pkgrel=1
pkgdesc="Advanced source port for Wolfenstein 3D engine games"
arch=("x86_64")
url="https://maniacsvault.net/ecwolf/"
license=("GPL-2.0-or-later")
depends=("gtk3" "libjpeg-turbo" "sdl2" "sdl2_mixer" "sdl2_net")
makedepends=("cmake")
install=ecwolf.install
source=("https://maniacsvault.net/${pkgname}/files/${pkgname}/1.x/${pkgname}-${pkgver}-src.tar.xz"
	"net.maniacsvault.${pkgname}.desktop")
sha256sums=('2121fb3fc63e532423681dcddf5d3848e19e8c6b4e2e1bfa802b16a2d42f84f5'
            '97bbc02334b250b5ca9a7076d6761e9ae54c1259a37521449b2ecedcaebfdcc3')
           
build() {
	cmake \
		-S "${pkgname}-${pkgver}-src" \
		-DCMAKE_INSTALL_PREFIX="/usr/"  \
		-B build \
		-DBUILD_PATCHUTIL=ON \
		-DGPL=ON \
		-Wno-dev

	make --directory build
}

package() {
	install -D --mode 644 -- "net.maniacsvault.${pkgname}.desktop" "${pkgdir}/usr/share/applications/net.maniacsvault.${pkgname}.desktop"

	cd -- "${pkgname}-${pkgver}-src"
	install -D --mode 644 -- android-libs/launcher/res/drawable-xhdpi/ic_launcher.png "${pkgdir}/usr/share/pixmaps/ecwolf.png"
	install -D --mode 644 -- README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd ../build
	install -D --mode 755 -- "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
	install -D --mode 644 -- "${pkgname}.pk3" "${pkgdir}/usr/share/${pkgname}/${pkgname}.pk3"
}
