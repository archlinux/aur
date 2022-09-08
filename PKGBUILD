# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: DisableGraphics elchifladod@gmail.com
pkgbase="korai-git"
pkgname="korai-git"
pkgrel=1
pkgver=$(date +%d.%m.%y)
pkgdesc="Fast, reliable and feature-packed manga and comics reader (git version)"
arch=("any")
conflicts=("korai")
url='https://github.com/DisableGraphics/Korai'
makedepends=("git" "imagemagick")
depends=("libarchive" "gtkmm3" "webkit2gtk" "vte3" "mangodl")
license=("GPL")
source=("git+https://github.com/DisableGraphics/Korai")
md5sums=("SKIP")
prepare() {
	cd ${srcdir}/
	ln -s Korai ${srcdir}/${pkgname^}
	cd ${srcdir}/${pkgname^}
	make -j$(nproc)
}
package() {

	install -Dm755 ${pkgname^}/build/korai "${pkgdir}/usr/bin/korai"
	install -Dm755 ${pkgname^}/build/korai-extensions/savepos.so "${pkgdir}/home/${USER}/.local/share/korai-extensions/savepos.so"

	echo "Converting icon..."
	convert ${pkgname^}/src/icon.xpm ${pkgname^}/src/icon.png

	install -Dm755 ${pkgname^}/src/icon.png "${pkgdir}/usr/share/icons/korai.png"

	echo "Adding application menu..."

	if [ -f "${pkgname^}/korai.desktop" ]; then
		rm -f "${pkgname^}/korai.desktop"
	fi
	touch "${pkgname^}/korai.desktop"
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
	Categories=Network;" >> "${pkgname^}/korai.desktop"

	install -Dm755 ${pkgname^}/korai.desktop "${pkgdir}/usr/share/applications/korai.desktop"
	pip install --upgrade mangadex-downloader
	echo "Korai requires mangadex-downloader (only available using pip) to download MangaDex manga directly" 
}

