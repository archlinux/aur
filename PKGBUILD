# Maintainer: bemxio <bemxiov at protonmail dot com>

pkgname="jpsxdec-bin"
pkgdesc="A modern, cross-platform PlayStation 1 audio/video converter"

pkgver=2.0
pkgrel=5

arch=(any)

url="http://jpsxdec.blogspot.com"
license=("BSD-3-Clause")

depends=("java-runtime>=8")
makedepends=(unzip gendesk)

provides=(jpsxdec)
#conflicts=(jpsxdec jpsxdec-git)

source=("https://github.com/m35/jpsxdec/releases/download/v${pkgver}/jpsxdec_v${pkgver}.zip" "jpsxdec")
md5sums=("bfa6db7bebac5a88e0c18336f066f1af" "df950dfd76574ba615d245eafd5e34d6")

prepare() {
	# move into the extracted directory
	cd "jpsxdec_v${pkgver}"

	# extract the logo out of the JAR file
	unzip -o -j jpsxdec.jar jpsxdec/gui/icon48.png -d .

	# generate a .desktop file
	gendesk -f -n \
		--pkgname jPSXdec \
		--pkgdesc "${pkgdesc}" \
		--exec jpsxdec \
		--icon jpsxdec.png \
		--categories "Development;Utility"
}

package() {
	# move into the extracted directory
	cd "jpsxdec_v${pkgver}"

	# copy the required .jar files
	install -Dm755 jpsxdec.jar "${pkgdir}/usr/share/java/jpsxdec/jpsxdec.jar"
	install -Dm755 jpsxdec-lib.jar "${pkgdir}/usr/share/java/jpsxdec/jpsxdec-lib.jar"

	# copy the executable script
	install -Dm755 ../jpsxdec "${pkgdir}/usr/bin/jpsxdec"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 icon48.png "${pkgdir}/usr/share/pixmaps/jpsxdec.png"
	install -Dm644 jPSXdec.desktop "${pkgdir}/usr/share/applications/jpsxdec.desktop"

	# copy the included license
	install -Dm644 doc/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}