# Maintainer: Amog-us <ask at amogussugomus at proton dot me>
# Contributor: davedatum <ask at davedatum dot com>

pkgname=rats-search-git
pkgver=1.11.0.r18.gcbda746
pkgrel=1
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client."
arch=("x86_64")
url="https://github.com/DEgITx/rats-search"
license=("MIT")
depends=("electron")
makedepends=("git" "npm" "imagemagick")
provides=("${pkgname}")
conflicts=("${pkgname}")
install=${pkgname}.install
source=("${pkgname}::git+$url.git"
		"${pkgname}.sh"
		"${pkgname}.desktop"
		"${pkgname}.install")
md5sums=('SKIP'
         'bf8d0e316e3904298ec63d3e5a44bc94'
         'a0d9bad379a6774e8bbc28da8a4979a3'
         '1a85dc610507dd1b2db75f95d1917126')

prepare() {
	sed -i -e '/"scripts": {/a "linux": "npm run prebuild && electron-builder --dir",' "${srcdir}/${pkgname}/package.json"
}

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	npm install --force && npm run linux
	#Yes, --force is really needed here. If you are worried about security, use a sandbox like firejail or bubblejail.
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/dist/linux-unpacked/." "${pkgdir}/opt/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  	do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${srcdir}/${pkgname}/resources/icons/512x512.png" \
    	-resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}
