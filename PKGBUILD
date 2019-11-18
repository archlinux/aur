# Maintainer: davedatum <ask at davedatum dot com>

pkgname=ultrascreen-git
pkgver=1.0.r0.gdc22aa0
pkgrel=1.1
pkgdesc="Share your screen"
arch=("x86_64")
url="https://github.com/w3yden/ultrascreen"
license=("GPL3")
depends=("electron4")
makedepends=("git" "npm" "imagemagick")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${pkgname}::git+$url.git#tag=v1.0"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         '195889e3c90b3740696b11e246d01801'
         'd800cd1006a5af6399827cb9cfc8d5cd'
         '287a23454fb9109715f15ab6157bf3aa')

prepare() {
	sed -i -e '15, 22d' "${srcdir}/${pkgname}/src/index.ejs"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	npm install && npm run build:dir
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/build/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  	do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${srcdir}/${pkgname}/build/icons/256x256.png" \
    	-resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}