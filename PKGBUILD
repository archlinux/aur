# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=stardrop-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="an Open Source Cross-platform mod manager for Stardew Valley"
arch=("x86_64")
url="https://floogen.gitbook.io/stardrop"
license=('GPL-3.0-or-later')
depends=("dotnet-runtime-8.0")
makedepends=("imagemagick" "gendesk")
options=(!strip)
provides=("stardrop")
conflicts=("stardrop")
source=("Stardrop-v${pkgver}-Linux-x64.zip::https://github.com/Floogen/Stardrop/releases/download/v${pkgver}/Stardrop-linux-x64.zip" "https://github.com/Floogen/Stardrop/raw/refs/heads/development/Stardrop/Assets/icon.ico" "x-scheme-handler-nxm.xml")
sha256sums=("ec6b6d241d46d0ff61a9282b9fb8b8d55bb53dfff21dadf0bdc6757f257b7c6e" "5d6884136fd49d0475b1b757429088871e729c21aefc6d9ff69725b1473fd7da" "1ede43022617702a3564a2db1c8041121b1703d1bd542709394d0ee0461df2ce")

prepare() {
	gendesk -f -n --pkgname="Stardrop" --pkgdesc="${pkgdesc}" --name="Stardrop" --comment="Stardew Valley Cross-Platform Mod Manger with Nexus support" --exec="/usr/bin/Stardrop --nxm %u" --icon="Stardrop" --categories="Game" --mimetypes="x-scheme-handler/nxm"
}

package() {
	#app icon
	magick "icon.ico" -flatten "Stardrop.png"
	install -Dm555 "Stardrop.png" "${pkgdir}/usr/share/pixmaps/Stardrop.png"

	#app
	install -dm755 "${pkgdir}/opt/"
	cp -far Stardrop "${pkgdir}/opt/"
	#removing Stardrop.sh as no longer needed
	rm "${pkgdir}/opt/Stardrop/Stardrop.sh"
	chmod +x "${pkgdir}/opt/Stardrop/Internal"

	#nxm mimetype scheme for nexus mod support
	if ! [ -f /usr/share/mime/packages ]; then
		install -Dm555 "x-scheme-handler-nxm.xml" "${pkgdir}/usr/share/mime/packages/x-scheme-handler-nxm.xml"
	fi

	#desktop application
	install -Dm755 "Stardrop.desktop" "${pkgdir}/usr/share/applications/Stardrop.desktop"
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Stardrop/Internal" "${pkgdir}/usr/bin/Stardrop"
}
