# Maintainer: Roman Kupriyanov <mr.eshua@gmail.com>
# Maintainer: davedatum <ask at davedatum dot com>

pkgname=dat-fox-helper-git
pkgver=0.2.0.r0.g6acb965
pkgrel=1
pkgdesc="A bridge to the Dat network for use by browsers"
arch=(any)
url="https://github.com/sammacbeth/dat-fox-helper"
license=("MIT")
depends=("firefox" "nodejs")
makedepends=("git" "npm")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}.git#tag=v0.2.0")
md5sums=('SKIP')

prepare() {
    sed -i "s|/path/to/dat-fox-helper/datfox-helper.js|/opt/${pkgname}/datfox-helper.js|g" "${srcdir}/${pkgname}/dathelper.json" 
    sed -i "s|(process.cwd(), 'library');|(process.env['HOME'], '/.local/share/${pkgname}');|g" "${srcdir}/${pkgname}/datfox-helper.js" 
}

pkgver() {
  	cd "${pkgname}"
  	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	npm install
}


package() {

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}/dathelper.json" \
			"${pkgdir}/usr/lib/mozilla/native-messaging-hosts/dathelper.json"

	install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" \
			"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

