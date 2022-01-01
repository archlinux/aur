# Maintainer: Quoorex <quoorex+aur at protonmail dot com>

pkgname=ftx-nativefier
pkgver=1.0
pkgrel=2
pkgdesc="FTX Client built with nodejs-nativefier (electron)"
arch=("arm64" "armv7l" "i686" "x86_64")
url="https://ftx.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")

source=("${pkgname}.desktop" "${pkgname}.png")
sha256sums=('51663e0c44c84c8480106d689b62d6787aa0472ac2a1ad847b61a43a760fa4e2'
            '350f936af537c6abe6750e2d836ea3f67d3a11d4754ea7f676df3a9ce81570ad')

build() {
	cd "${srcdir}"
	nativefier "https://ftx.com" --name "FTX" --internal-urls ".*ftx.com.*" -i "${pkgname}.png"
}

package() {
	install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
	cp -rL "${srcdir}/FTX-linux"* "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/FTX"
	ln -s "/opt/${pkgname}/FTX" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}
