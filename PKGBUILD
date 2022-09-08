# Contributor: DisableGraphics elchifladod@gmail.com
pkgbase="korai"
pkgname="korai"
pkgrel=2
pkgver=0.2.1
pkgdesc="Fast, reliable and feature-packed manga and comics reader"
arch=("any")
url='https://github.com/DisableGraphics/Korai'
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
conflicts=("korai-git")
license=("GPL")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2f40b9bbddc3aca79fd6c4c34e78a68eea89bb9fb289f4324636829a0586bb9e8ee15db89fb5faba3ac98b2a2dbf4b474a0b7e93eb24a9da2354af1e3f688964')
prepare() {
	cd ${srcdir}/${pkgname^}-${pkgver}
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
	pip install --upgrade mangadex-downloader
	echo "Korai requires mangadex-downloader (only available using pip) to download MangaDex manga directly" 
}

