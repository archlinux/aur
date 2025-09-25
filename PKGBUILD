# Maintainer: Voylin <voylinslife@gmail.com>

pkgname=gozen-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A minimalistic video editor (binary AppImage release)"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
provides=('gozen')
conflicts=('gozen' 'gozen-git')
options=(!strip)

# Adjust this to match the current release file
_appimage="gozen-v${pkgver}-alpha-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/VoylinsGamedevJourney/GoZen/releases/download/v${pkgver}-alpha/${_appimage}"
)
sha256sums=('0cfda2c41730efe8bfd993234475eca5496d7992a07233938f56333f7c2ee1a5')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/gozen-bin.AppImage"

	# Symlink into PATH
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/gozen-bin.AppImage" "${pkgdir}/usr/bin/gozen-bin"

	wget -O gozen-bin.desktop "https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/refs/heads/master/assets/linux/gozen.desktop"
	wget -O gozen.png https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/master/assets/linux/gozen.png
	wget -O gozen.svg https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/master/assets/linux/gozen.svg
	wget -O LICENSE https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/refs/heads/master/LICENSE

	# Make a different desktop file for the -git build.
	sed -i 's/^Name=GoZen$/Name=GoZen-bin/' gozen-bin.desktop
	sed -i "s/^Exec=gozen$/Exec=${pkgname}/" gozen-bin.desktop
	sed -i "s/^Icon=gozen$/Icon=${pkgname}/" gozen-bin.desktop

	# Desktop integration (optional, if your repo includes .desktop and icons)
	install -Dm644 "gozen-bin.desktop" "${pkgdir}/usr/share/applications/gozen-bin.desktop"
	install -Dm644 "gozen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gozen.png"
	install -Dm644 "gozen.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gozen.svg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

