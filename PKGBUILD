# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai"
pkgrel=1
pkgver=0.1.4
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=('https://github.com/DisableGraphics/Korai/archive/refs/tags/v0.1.4.tar.gz')
sha512sums=('1ec1cb97bb8355457952897dd601c772e3caf075762c6af2dd77d5e2d4e4326dfd7df517bab938aaeb42cacdfa82969d80b456cb03efbc6a2a183fc161735094')
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

