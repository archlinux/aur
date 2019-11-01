# Maintainer: davedatum <ask at davedatum dot com>

pkgname=imagine-git
_pkgname=imagine
pkgver=0.5.0.r0.g7bea16d
pkgrel=1.1
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=("MIT")
depends=("electron2" "imagemagick")
makedepends=("git" "npm")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${_pkgname}.install
source=("${_pkgname}::git+$url.git#tag=v0.5.0"
		"${_pkgname}.sh"
		"${_pkgname}.desktop"
		"${_pkgname}.install")
md5sums=('SKIP'
         'e7577f322638f548ea42e7e1c9cd77d8'
         '7f80869e29fd5af22e4c303f9a10975f'
         '671bee3aec8f7e0a0556ee8d336c604d')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}" 
	npm install && npm run pack
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${_pkgname}/app.asar"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  	do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/$_size/apps"
    	convert "${srcdir}/${_pkgname}/build/icon.png" \
    	-resize "$_size" "${pkgdir}/usr/share/icons/hicolor/$_size/apps/${_pkgname}.png"
  	done
}