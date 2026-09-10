# Maintainer: Shira
# Contributor: Shira
pkgname=seerrng-deb
_srcver="v3.19.3"
pkgver="${_srcver#v}"
pkgrel=2
pkgdesc="Seerr fork with music, books and audiobooks support. Installed from .deb, hardened service file"
arch=('x86_64')
url="https://github.com/snapetech/seerrng"
license=('MIT')
depends=('nodejs>=22')
provides=('seerrng' 'seerr')
conflicts=('seerrng' 'seerrng-git' 'seerrng-bin')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/seerrng_${pkgver}_amd64.deb"
	"seerrng.service")
sha256sums=('78f4d570ecbaae4221740327873d70fbef37b7c7ebe47919a4137402049c5d35'
	    'SKIP')

package(){

	install -dm755 "${pkgdir}/etc/seerrng"

	# Extract package data
	tar -xI unzstd -f data.tar.zst -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	install -Dm644 "usr/lib/seerrng/node_modules/.pnpm/zwitch@2.0.4/node_modules/zwitch/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "usr/share/doc/seerrng/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	install -Dm644 "${srcdir}/seerrng.service" "${pkgdir}/usr/lib/systemd/system/seerrng.service"

	cd ..

}
