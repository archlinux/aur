# Maintainer: Lucas Malandrino <lucas.malandrino@gmail.com>
pkgname='edex-ui'
pkgver=1.0.1
pkgrel=1
pkgdesc="A science fiction desktop running everywhere. Awesome."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/GitSquared/edex-ui'
license=('GPL3')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libappindicator-sharp')
makedepends=('npm')
provides=('edex-ui')
install="edex-ui.install"
source=("https://github.com/GitSquared/${pkgname}/archive/v${pkgver}.tar.gz"
	"package.json.patch")
sha256sums=('18840ed0b73806d70a9e33a9171f811245c692bba8c02aa44334c1ca5f9a14c7'
	'66752ffc06b44692892967689e320af41dcd1365cdfe578cddb3b6d1123888f2')

prepare() {
	# Temp fix for the missing mail field that causes electron-builder to fail
	patch -p1 -i "${srcdir}/package.json.patch" "${srcdir}/${pkgname}-${pkgver}/src/package.json"
}

build() {
	cd "${pkgname}-${pkgver}"

	npm install

	# Build tarball with electron-builder
	npm run prebuild-linux
	${srcdir}/${pkgname}-${pkgver}/node_modules/.bin/electron-builder -l pacman -p never
	npm run postbuild-linux
}

package() {
	cd "${pkgname}-${pkgver}"
	
	# Extract the package made by electron-builder
	# It's not pretty but blame electron
	tar xf ./dist/eDEX-UI-linux.pacman -C "${pkgdir}"
	cd "${pkgdir}"
	
	# Garbage madeby electron-builder
	rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"

	chmod 755 "${pkgdir}/opt/eDEX-UI/edex-ui"
}
