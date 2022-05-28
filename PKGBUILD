# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.2.0
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=('https://github.com/DisableGraphics/Korai/archive/refs/tags/v0.2.0.tar.gz')
sha512sums=('cdddd9b1fa79bac063d2321458d03e1100624691612f8d8d1d99fcf7cae5fa06b34bf0ffcdc8aa2944adcfd6d9fd3d6abb0e148398665a7980ac06bdeb7ef2b3')
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

	mkdir -p "${pkgdir}/home"
	mkdir -p "${pkgdir}/home/$USER"
	mkdir -p "${pkgdir}/home/$USER/.local"
	mkdir -p "${pkgdir}/home/$USER/.local/share"
	mkdir -p "${pkgdir}/home/$USER/.local/share/korai-extensions"

	cp ${srcdir}/Korai-${pkgver}/build/korai "${pkgdir}/usr/bin/"
	cp ${srcdir}/Korai-${pkgver}/build/korai-extensions/savepos.so "${pkgdir}/home/$USER/.local/share/korai-extensions/savepos.so"

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

