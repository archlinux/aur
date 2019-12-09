# Maintainer: davedatum <ask at davedatum dot com>

pkgname=mini-diary-git
pkgver=2.5.1.r0.g1749c43
pkgrel=1
pkgdesc="Simple and secure journal app"
arch=("x86_64")
url="https://github.com/samuelmeuli/mini-diary"
license=("MIT")
depends=("electron")
makedepends=("git" "npm" "imagemagick")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${pkgname}::git+$url.git#tag=v2.5.1"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         '4266c8313117e3bb6dd92fc41d5bbdf6'
         '391fea43fcc92e14b7f16298c9ac8c83'
         '0f4f35bfb1705117bf18b5c23e987ed6')

prepare() {
	sed -i -e '/"scripts": {/a "linux": "npm run build && electron-builder --dir",' "${srcdir}/${pkgname}/package.json"
	sed -i -e '/"build:app": "electron-builder --mac --windows --linux"/d' "${srcdir}/${pkgname}/package.json"
	sed -i -e '/webPreferences: {/a devTools: false,' "${srcdir}/${pkgname}/src/main/main.ts"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	npm install && npm run linux
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  	do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${srcdir}/${pkgname}/website/img/app-icon.png" \
    	-resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}