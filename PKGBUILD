# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="zgreending-bin"
pkgname="zgreending-bin"
tag="1.0.0"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Web browser that protects you from onlookers. Made with mono, Webkit sharp and WebkitGTK (Webkit2GTK) in C#"
arch=("any")
makedepends=("unzip")
depends=("mono" "webkit2-sharp" "noto-fonts")
license=("GPL")
source=("https://github.com/DisableGraphics/zGreending/releases/download/${tag}/zGreending.zip")
sha512sums=("SKIP")
prepare() {
	unzip -o ./zGreending.zip
}
package() {
	mkdir -p "${pkgdir}/opt/zGreending"
	echo "Deleting useless debug binaries..."
	rm "${srcdir}/Debug/Greending.pdb"

	#Create folders

	mkdir -p "${pkgdir}/opt/zGreending/conf"
	mkdir -p "${pkgdir}/opt/zGreending/downloads"
	mkdir -p "${pkgdir}/opt/zGreending/icons"

	#Move the main binaries

	cp "${srcdir}/Debug/Greending.exe" "${pkgdir}/opt/zGreending/Greending.exe"

	#Move the configuration

	cp "${srcdir}/Debug/conf/height.conf" "${pkgdir}/opt/zGreending/conf/height.conf"
	cp "${srcdir}/Debug/conf/home.conf" "${pkgdir}/opt/zGreending/conf/home.conf"
	cp "${srcdir}/Debug/conf/incognito.conf" "${pkgdir}/opt/zGreending/conf/incognito.conf"
	cp "${srcdir}/Debug/conf/menubar.conf" "${pkgdir}/opt/zGreending/conf/menubar.conf"
	cp "${srcdir}/Debug/conf/pages" "${pkgdir}/opt/zGreending/conf/pages"
	cp "${srcdir}/Debug/conf/searchengine.conf" "${pkgdir}/opt/zGreending/conf/searchengine.conf"
	cp "${srcdir}/Debug/conf/width.conf" "${pkgdir}/opt/zGreending/conf/width.conf"

	#Move the icon
	cp "${srcdir}/Debug/icons/icon.png" "${pkgdir}/opt/zGreending/icons/icon.png"

	#Other things

	chmod 7777 "${pkgdir}/opt/zGreending"
	if [ -f "${pkgdir}/opt/zGreending/greending.sh" ]; then
		rm -f "${pkgdir}/opt/zGreending/greending.sh"
	fi
	touch "${pkgdir}/opt/zGreending/greending.sh"
	echo "cd /opt/zGreending && mono /opt/zGreending/Greending.exe" >> "${pkgdir}/opt/zGreending/greending.sh"
	chmod +x "${pkgdir}/opt/zGreending/greending.sh"

	mkdir -p "${pkgdir}/usr/bin"
	touch "${pkgdir}/usr/bin/zGreending"
	chmod +x "${pkgdir}/usr/bin/zGreending"
	echo "cd /opt/zGreending && mono /opt/zGreending/Greending.exe" >> "${pkgdir}/usr/bin/zGreending"
	
	mkdir -p "${pkgdir}/usr/share/applications"
	if [ -f "${pkgdir}/usr/share/applications/zGreending.desktop" ]; then
		rm -f "${pkgdir}/usr/share/applications/zGreending.desktop"
	fi
	touch "${pkgdir}/usr/share/applications/zGreending.desktop"
	echo "#!/usr/bin/env xdg-open 
	[Desktop Entry]
	Version=1.0
	Type=Application
	Name=zGreending
	Comment=Simple, yet usable web browser made with mono, Webkit sharp and WebkitGTK (Webkit2GTK for C#)
	Exec=/opt/zGreending/greending.sh
	Icon=/opt/zGreending/icons/icon.png
	Path=/opt/zGreending
	Terminal=false
	StartupNotify=false
	Categories=Network;" >> "${pkgdir}/usr/share/applications/zGreending.desktop"

	echo "Deleting sources..."

	cd ..

	if [ -f "./zGreending.zip" ]; then
		rm -f ./zGreending.zip
	fi
}


