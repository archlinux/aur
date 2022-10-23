# Maintainer: Nikolas Spiridakis <1nikolas at hotmail dot gr>

# Templated from https://aur.archlinux.org/packages/instagram-nativefier

pkgname=microsoft-whiteboard-nativefier
pkgver=1.1
pkgrel=1
pkgdesc="Microsoft Whiteboard, a cloud whiteboard application. Built with nativefier (electron)"
arch=('any')
url="https://whiteboard.office.com/"
license=("GPL")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")

source=("${pkgname}.desktop" "${pkgname}.png" "inject.css")
sha256sums=("9e7d87665990994192569fb53fc2b78c0e8c0f941e94a002389448bb441f4d60"
            "e4d9c483df1ba356e0f825225522437c7974d99d9b86730c62165bb8af7a265f"
            "ef24638235429cdbbe466a05971770615a4f679ad35b4a8939f47d3e9d864166")

appname="MicrosoftWhiteboard"

build() {
	cd "${srcdir}"
	nativefier "https://whiteboard.office.com/" --single-instance --internal-urls "\.(microsoft365\.com|microsoftonline\.com|windows\.net)" --inject ./inject.css --file-download-options '{"saveAs": true}' --name ${appname} -i "${pkgname}.png"
}

package() {
	install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
	cp -rL "${srcdir}/${appname}-linux"* "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/${appname}"
	ln -s "/opt/${pkgname}/${appname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}
