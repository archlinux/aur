# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=stardrop-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="an Open Source Cross-platform mod manager for Stardew Valley"
arch=("x86_64")
url="https://floogen.gitbook.io/stardrop"
license=('GPL-3.0-or-later')
depends=("dotnet-runtime-7.0-bin")
makedepends=("imagemagick" "gendesk")
options=(!strip)
provides=("stardrop")
conflicts=("stardrop")
source=("https://github.com/Floogen/Stardrop/releases/download/v${pkgver}/Stardrop-linux-x64.zip" "https://github.com/Floogen/Stardrop/raw/refs/heads/development/Stardrop/Assets/icon.ico" "x-scheme-handler-nxm.xml")
sha256sums=("33757776ba7f4d1c2165b182089838ed3736257b17a489d8b75356e1ad839da3" "5d6884136fd49d0475b1b757429088871e729c21aefc6d9ff69725b1473fd7da" "1ede43022617702a3564a2db1c8041121b1703d1bd542709394d0ee0461df2ce")

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

	#nxm mimetype scheme for nexus mod support
	if ! [ -f /usr/share/mime/packages ]; then
		install -Dm555 "x-scheme-handler-nxm.xml" "${pkgdir}/usr/share/mime/packages/x-scheme-handler-nxm.xml"
	fi

	#desktop application
	install -Dm755 "Stardrop.desktop" "${pkgdir}/usr/share/applications/Stardrop.desktop"
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Stardrop/Internal" "${pkgdir}/usr/bin/Stardrop"
}
