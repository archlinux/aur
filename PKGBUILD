# Maintainer: Karol Pieniący <karol.pieniacy@gmail.com>
_appname=ArduDeck
pkgname=ardudeck-appimage
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern cross-platform ground control station for ArduPilot, Betaflight, and iNav (AppImage)"
arch=('x86_64')
url="https://github.com/rubenCodeforges/ardudeck"
license=('GPL-3.0-only')
depends=('fuse2')
makedepends=('imagemagick')
provides=('ardudeck')
conflicts=('ardudeck')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x86_64.AppImage"
        "${pkgname}-${pkgver}.LICENSE::https://raw.githubusercontent.com/rubenCodeforges/ardudeck/v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('68a44ceaf90f92071de08b2bad4dcfdfad16ae7634a21242f44b0bd7eedb2ede'
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

	# Upstream ships a single 1024x1024 icon, a size hicolor's index.theme does
	# not declare, so themed lookups (the app launcher) miss it. Downscale the
	# AppImage's .DirIcon master into standard hicolor sizes.
	local size
	for size in 512 256 128 64 48; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		magick "${srcdir}/squashfs-root/.DirIcon" -resize "${size}x${size}" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
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
