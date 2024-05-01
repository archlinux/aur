# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mr.Smith1974
pkgname=cosmonium-bin
_pkgname=Cosmonium
pkgver=0.3.0.dev876
pkgrel=1
pkgdesc="3D astronomy and space exploration program."
arch=("x86_64")
url='https://github.com/cosmonium/cosmonium'
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'alsa-lib'
	'nspr'
	'gtk2'
	'nss'
	'libxss'
	'libglvnd'
)
makedepends=(
	'gendesk'
)
options=(
    '!strip'
)
source=(
	"${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}_manylinux2014_${CARCH}.tar.gz"
	"${pkgname%-bin}.sh"
)
sha256sums=('e0b6ed545a381171d97492ee113aebcc375bef44303915d2c3026e740cfcf4d6'
            '6a94dd1542c9f172f61db12717e70d89895d1b81665a4201bbf3456823d38b06')
build() {
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	gendesk -q -f -n --categories="Science" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
	install -Dm755 -d "${pkgdir}/opt"
	cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	for _icons in 16 32 48 64 128 256 512;do
		install -Dm644 "${srcdir}/${pkgname%-bin}/textures/${pkgname%-bin}-${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
	done
	install -Dm644 "${srcdir}/${pkgname%-bin}/License" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}