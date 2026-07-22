# Maintainer: Karol Pieniący <karol.pieniacy@gmail.com>
_appname=ArduDeck
pkgname=ardudeck-appimage
pkgver=0.0.33
pkgrel=1
pkgdesc="Modern cross-platform ground control station for ArduPilot, Betaflight, and iNav (AppImage)"
arch=('x86_64')
url="https://github.com/rubenCodeforges/ardudeck"
license=('GPL-3.0-only')
depends=('fuse2')
provides=('ardudeck')
conflicts=('ardudeck')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x86_64.AppImage"
        "${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/rubenCodeforges/ardudeck/v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('e659f4f17e6d03e6e67e75ad437838fabcedea453405fc0f483e1ebbcb2da46d'
            '86030766b025ce4e69bdc8e3cf33ba9e573b92e32c5392d0b8df0d1dddbc35d1')

build() {
	# Extract only to lift the bundled icons + .desktop (needs no FUSE).
	chmod +x "${pkgname}-${pkgver}.AppImage"
	./"${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
	# Install and run the packed AppImage; fuse2 mounts it at runtime.
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

	# Icons shipped inside the AppImage -> hicolor theme, renamed to $pkgname.
	local icon size
	for icon in "${srcdir}"/squashfs-root/usr/share/icons/hicolor/*/apps/*.png; do
		[ -e "$icon" ] || continue
		size=$(basename "$(dirname "$(dirname "$icon")")")
		install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
	done

	# .desktop shipped inside the AppImage: repoint the Exec binary and Icon at
	# our install, preserving upstream's launch args (--no-sandbox %U) and the
	# StartupWMClass used for window/launcher grouping.
	install -Dm644 "${srcdir}"/squashfs-root/*.desktop \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -i -e "s|^Exec=[^ ]*|Exec=${pkgname}|" \
	       -e "s|^Icon=.*|Icon=${pkgname}|" \
	       "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}.LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
