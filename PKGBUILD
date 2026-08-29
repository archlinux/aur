# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=30.1.0
pkgrel=1
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"
license=('https://polypane.app/legal/')
sha256sums=('d29d31f0be91e71b1fcccdbdc3b0d37546f4e6dd48cec34e5072207c341e7665')
makedepends=('p7zip' 'curl' 'jq')
noextract=("$_pkgname-${pkgver}.AppImage")
options=('!strip')

source=(${_pkgname}-${pkgver}.AppImage::https://github.com/firstversionist/polypane/releases/download/v${pkgver}/polypane-${pkgver}.AppImage)

prepare() {
	cd "${srcdir}"

	# Extract AppImage Files
	7z x -y ${_pkgname}-${pkgver}.AppImage usr/share/icons '*.desktop' >/dev/null

	# Upstream renames the entry between releases (e.g. com.firstversionist.polypane.desktop),
	# so discover it rather than hardcoding a name
	_desktop=$(find . -maxdepth 1 -name '*.desktop' -printf '%f\n')
	if [ "$(printf '%s' "${_desktop}" | grep -c .)" -ne 1 ]; then
		echo "expected exactly one .desktop entry in the AppImage root, found: ${_desktop:-none}" >&2
		return 1
	fi
	[ "${_desktop}" = "${pkgname}.desktop" ] || mv "${_desktop}" "${pkgname}.desktop"

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
