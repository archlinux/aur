# Maintainer: davedatum <ask at davedatum dot com>

pkgname=topsi-project-manager-git
pkgver=0.1.r0.g1c9d0d4
pkgrel=1.3
pkgdesc="A Desktop Kanban board app"
arch=("x86_64")
url="https://github.com/Physiix/topsi-project-manager"
license=("AGPL3")
depends=("electron4")
makedepends=("git" "npm")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${pkgname}::git+$url.git#tag=v0.1"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         '3c93fa571256014cc3428b149a7f4a47'
         '736abf73bd212a43cbc2015432c16739'
         '3adfb178bd5c883661b1fccf17395b48')

prepare() {
	sed -i -e '/"scripts"/a "linux": "node .electron-vue/build.js && electron-builder --dir",' "${srcdir}/${pkgname}/package.json"
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
	install -Dm755 "${srcdir}/${pkgname}/build/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/app.asar"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


  	for _size in "1024x1024" "512x512" "256x256" "128x128" "64x64" "48x48" "32x32" "24x24" "16x16"
  	do
    	install -Dm755 "${srcdir}/${pkgname}/build/icons/png/${_size}.png" \
    		"${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done

}