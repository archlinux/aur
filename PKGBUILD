# Contributor: nalquas <nalquas.dev@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tvtower-bin
_pkgname=TVTower
pkgver=0.8.3.2
_subver=20250207
pkgrel=1
pkgdesc="A tribute to Mad TV. Written in BlitzMax, Lua and a bit of C.(Prebuilt version)"
arch=(
	'i686'
	'x86_64'
)
url="https://www.tvtower.org/"
_ghurl="https://github.com/TVTower/TVTower"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'glu'
	'libglvnd'
	'freetype2'
	'libxcb'
)
makedepends=(
	'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
	"${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${_subver}.zip"
	"${pkgname%-bin}.sh"
)
sha256sums=('bd39972e1851994174d35693d20c46d274a0ead465e2ba94527760e5137b0108'
            '66ba0a42698a2815cfec1c2a5a2b459e4ea9c054481c859acf5dd4aa84d49ce8')
prepare() {
	case "${CARCH}" in
		i686)
			_RUNNAME="${_pkgname}_Linux32"
		;;
		x86_64)
			_RUNNAME="${_pkgname}_Linux64"
		;;
	esac
	sed -e "
		s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_RUNNAME}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
	gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin}"
	install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}/logfiles"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
	rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/"*.{bat,exe}
	rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/"{"${_pkgname}_arm64.app","${_pkgname}.app"}
	LogtxtFile=(app ai1 ai2 ai3 ai4 app.error)
    for _logtxt in "${LogtxtFile[@]}";do
		touch "${srcdir}/usr/lib/${pkgname%-bin}/logfiles/log.${_logtxt}.txt"
	done
	touch "${srcdir}/usr/lib/${pkgname%-bin}/log.profiler.txt"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
	install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/LICENCE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	chmod 777 "${pkgdir}/usr/lib/${pkgname%-bin}/savegames"
	find "${pkgdir}/usr/lib/${pkgname%-bin}/logfiles" -name "log.*.txt" -perm 644 -exec chmod 666 {} +
}