# Maintainer: davedatum <ask at davedatum dot com>

pkgname=imagine-git
pkgver=0.5.1.r0.g20d46c3
pkgrel=1
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=("MIT")
depends=("electron" "imagemagick" "gconf")
makedepends=("git" "npm")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
options=(!strip)
source=("${pkgname}::git+$url.git#tag=v0.5.1"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         'd59bb8174b24651acc0f5d6c68796eaa'
         'e9cea0ab2cde2303a73d97902b340930'
         'a2123b329fe19aa386ffd3af1483594c')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}" 
	npm install && npm run pack
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}/dist/linux-unpacked/." "${pkgdir}/opt/${pkgname}"
  chmod -R 755 "${pkgdir}/opt/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/$_size/apps"
    convert "${srcdir}/${pkgname}/build/icon.png" \
    -resize "$_size" "${pkgdir}/usr/share/icons/hicolor/$_size/apps/${pkgname}.png"
  done
}