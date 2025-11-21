# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=27.0.0
pkgrel=1
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"
license=('https://polypane.app/legal/')
sha256sums=('980b9c157de64abedba3a7e541525774290931d42b6c48479624b88693e49f2d')
makedepends=('p7zip' 'curl' 'jq')
noextract=("$_pkgname-${pkgver}.AppImage")
options=('!strip')

source=(${_pkgname}-${pkgver}.AppImage::https://github.com/firstversionist/polypane/releases/download/v${pkgver}/polypane-${pkgver}.AppImage)

prepare() {
	cd "${srcdir}"

	# Extract AppImage Files
	7z x -y ${_pkgname}-${pkgver}.AppImage usr/share/icons >/dev/null
	7z x -y ${_pkgname}-${pkgver}.AppImage ${pkgname}.desktop >/dev/null

	# Prevent duplicate .desktop entries that include "(version)"
	sed -i "s/ (${pkgver})//" "${pkgname}.desktop"

	# Make the .desktop launch the installed binary instead of 'AppRun'
	sed -i -E 's|^Exec=.*|Exec=/usr/bin/polypane %U|' "${pkgname}.desktop"
	# If TryExec exists, point it to our symlink as well (no-op if not present)
	sed -i -E 's|^TryExec=.*|TryExec=/usr/bin/polypane|' "${pkgname}.desktop"
}

package() {
	cd "${srcdir}"

	# Icons
	install -dm755 "${pkgdir}/usr/share"
	cp -dr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"

	# Desktop file
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# AppImage payload
	install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}-${pkgver}.AppImage"

	# Symlink in PATH
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/appimages/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
