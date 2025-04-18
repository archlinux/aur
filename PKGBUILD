# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mr.Smith1974
pkgname=cosmonium-bin
_pkgname=Cosmonium
pkgver=0.3.0.dev876
pkgrel=3
pkgdesc="3D astronomy and space exploration program.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/cosmonium/cosmonium"
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
            '3fa20f85c87576bc9daa1db5d163def5aa239d040b7e308d747cc46bdd1b1713')
prepare() {
	sed -i -e "
		s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
	gendesk -q -f -n \
		--pkgname="${pkgname%-bin}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Science" \
		--name="${_pkgname}" \
		--exec="${pkgname%-bin}"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib"
	cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	for _icons in 16 32 48 64 128 256 512;do
		install -Dm644 "${srcdir}/${pkgname%-bin}/textures/${pkgname%-bin}-${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
	done
	install -Dm644 "${srcdir}/${pkgname%-bin}/License" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}