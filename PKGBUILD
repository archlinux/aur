# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Plaunarome <plaunarome@protonmail.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.4.1
pkgrel=4
pkgdesc="Advanced source port for Wolfenstein 3D engine games"
arch=("x86_64")
url="https://maniacsvault.net/ecwolf/"
license=("GPL-2.0-or-later")
depends=("gtk3" "libjpeg-turbo" "sdl2" "sdl2_mixer" "sdl2_net")
makedepends=("cmake")
install=ecwolf.install
source=("https://maniacsvault.net/${pkgname}/files/${pkgname}/1.x/${pkgname}-${pkgver}-src.tar.xz"
	"net.maniacsvault.${pkgname}.desktop"
	gcc14.patch)
sha256sums=('8ebd495d2806c9d0e736656970e736730a005d3b43c7f5729f52c812b22f9e2d'
            '97bbc02334b250b5ca9a7076d6761e9ae54c1259a37521449b2ecedcaebfdcc3'
            '79b1886e774da244ac05d0f8de5a332573730d742472911b59b5840532d4d1bc')
           
prepare() {
  cd "${pkgname}-${pkgver}-src"
  patch -p1 -i ../gcc14.patch 
}

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
