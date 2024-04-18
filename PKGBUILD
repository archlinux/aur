# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Mr.Smith1974
pkgname=abstreet-bin
_pkgname="A/B Street"
pkgver=0.3.49
pkgrel=1
pkgdesc="Transportation planning and traffic simulation software for creating cities friendlier to walking, biking, and public transit"
arch=('x86_64')
url="https://a-b-street.github.io/docs/"
_ghurl="https://github.com/a-b-street/abstreet"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_v${pkgver//./_}.zip"
)
sha256sums=('0596acf7ec134b4fef7507947b3188381953e0869788a2e6b81040bbb4d6f6bc')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin}"
	find "${srcdir}/${pkgname%-bin}_linux_v${pkgver//./_}" -name "*.sh" \
		-exec sed -i "s|echo See logs in output.txt|cd \/opt\/${pkgname%-bin}|g;s| 1> output.txt 2>&1||g" {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
	cp -r "${srcdir}/${pkgname%-bin}_linux_v${pkgver//./_}/"* "${pkgdir}/opt/${pkgname%-bin}"
	ln -sf "/opt/${pkgname%-bin}/play_${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}_linux_v${pkgver//./_}/data/system/assets/pregame/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	chmod 777 "${pkgdir}/opt/${pkgname%-bin}/data/player"
}