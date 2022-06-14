# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.2.0
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
url='https://github.com/DisableGraphics/Korai'
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('cdddd9b1fa79bac063d2321458d03e1100624691612f8d8d1d99fcf7cae5fa06b34bf0ffcdc8aa2944adcfd6d9fd3d6abb0e148398665a7980ac06bdeb7ef2b3')
prepare() {
	tar xf v${pkgver}.tar.gz
	cd ${srcdir}/Korai-${pkgver}/
	make -j$(nproc)
}
package() {
	install -Dm755 ${pkgname^}-${pkgver}/build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 ${pkgname^}-${pkgver}/build/korai-extensions/savepos.so "${pkgdir}/home/${USER}/.local/share/korai-extensions/savepos.so"

	echo "Converting icon..."
	convert ${pkgname^}-${pkgver}/src/icon.xpm ${pkgname^}-${pkgver}/src/icon.png

	install -Dm755 ${pkgname^}-${pkgver}/src/icon.png "${pkgdir}/usr/share/icons/korai.png"

	echo "Adding application menu..."

	if [ -f "${pkgname^}-${pkgver}/korai.desktop" ]; then
		rm -f "${pkgname^}-${pkgver}/korai.desktop"
	fi
	touch "${pkgname^}-${pkgver}/korai.desktop"
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
	Categories=Network;" >> "${pkgname^}-${pkgver}/korai.desktop"

	install -Dm755 ${pkgname^}-${pkgver}/korai.desktop "${pkgdir}/usr/share/applications/korai.desktop"
}

