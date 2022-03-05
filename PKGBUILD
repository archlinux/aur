# Maintainer: netbenix <netbenix at codenoodles dot de>
pkgname=replika-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="The AI companion who cares"
arch=("i686" "x86_64")
url="https://my.replika.ai/"
license=('unknown')
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier")
optdepends=("libindicator-gtk3")

source=("${pkgname}.desktop" "${pkgname}.png")
sha256sums=("c945a9763b265a0c1df33490aee2290b269596da5092d42838f1986b7c1deb9e"
			"302031a0868db710a6956b93085783db8ce8f148bf8ad789f1bbeca963d0a2ab")

build() {
	cd "${srcdir}"
	nativefier "https://my.replika.ai" \
		--name "ReplikaAI" \
		-i "${pkgname}.png"
}

package() {
	install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
	cp -rL "${srcdir}/ReplikaAI"* "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/ReplikaAI"
	ln -s "/opt/${pkgname}/ReplikaAI" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}