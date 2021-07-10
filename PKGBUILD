# Maintainer: Guilherme Ferreira <sw5guilherme at yahoo dot com dot br>

pkgname=nonograms-katana-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="A nodejs nativefier client for Nonograms Katana, a logic puzzle game developed and published by ucdevs."
arch=("i686" "x86_64")
url="https://nonograms-katana.com/"
license=("GPL")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")

source=("${pkgname}.desktop" "${pkgname}.png")
sha256sums=("6e11cabccb2210b63668eb910de5b8d548b16447dfa264141ac4ff161354f3ef"
            "7ec69738a9d936b536a87c408a4324f0f24d6e61445fd430d6bfb4d2897e3052")

build() {
	cd "${srcdir}"
	nativefier "https://nonograms-katana.com/play/" --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0' --name "Nonograms Katana" --internal-urls ".*nonograms-katana.com*" -m -i "${pkgname}.png"
}

package() {
	install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
	cp -rL "${srcdir}/NonogramsKatana-linux"* "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/NonogramsKatana"
	ln -s "/opt/${pkgname}/NonogramsKatana" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}
