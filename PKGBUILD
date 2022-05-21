# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.1.3
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=('https://github.com/DisableGraphics/Korai/archive/refs/tags/v0.1.3.tar.gz')
sha512sums=('78a002f6b1afe28108307c5752152ef0ea00040c69cfa6e7164180d23ac4b807d8688c2992d3f03acda2656d42539f8feb741247bb252c8a2e3cf4db5cf49676')
prepare() {
	tar xf v${pkgver}.tar.gz
	cd ${srcdir}/Korai-${pkgver}/
	make -j$(nproc)
}
package() {
	mkdir -p "${pkgdir}/usr/"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/share/icons/"

	cp ${srcdir}/Korai-${pkgver}/build/korai "${pkgdir}/usr/bin/"

	echo "Converting icon..."
	convert ${srcdir}/Korai-${pkgver}/src/icon.xpm "${pkgdir}/usr/share/icons/korai.png"

	echo "Adding application menu..."

	mkdir -p "${pkgdir}/usr/share/applications/"

	if [ -f "${pkgdir}/usr/share/applications/korai.desktop" ]; then
		rm -f "${pkgdir}/usr/share/applications/korai.desktop"
	fi
	touch "${pkgdir}/usr/share/applications/korai.desktop"
	echo "#!/usr/bin/env xdg-open
	[Desktop Entry]
	Version=Git
	Type=Application
	Name=Korai
	Comment=\"Fast, reliable and feature-packed manga/comic book reader\"
	Exec=/usr/bin/korai
	Icon=/usr/share/icons/korai.png
	Path=/home/$USER/.local/share
	Terminal=false
	StartupNotify=false
	Categories=Network;" >> "${pkgdir}/usr/share/applications/korai.desktop"
}

