# Contributor: nalquas <nalquas.dev@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tvtower-bin
_pkgname=TVTower
pkgver=0.8.2
_subver=20231220
pkgrel=1
pkgdesc="A tribute to Mad TV. Written in BlitzMax, Lua and a bit of C."
arch=(
	'i686'
	'x86_64'
)
url="https://www.tvtower.org/"
_ghurl="https://github.com/TVTower/TVTower"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'libglvnd'
	'freetype2'
	'libxcb'
	'lib32-glu'
	'lib32-libxcb'
	'lib32-gcc-libs'
	'lib32-libglvnd'
	'lib32-glibc'
	'lib32-freetype2'
)
makedepends=(
	'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
	"${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${_subver}.zip"
	"${pkgname%-bin}.sh"
)
sha256sums=('503e6ff876e5afbcbb56638c6076b54d5392e67e48651b3b7bdf44faf750f286'
            '0ff0878274ed1b847d53abda04a751ca6ee7ce3f8da476e6b39660c1224083e4')
build() {
	if [ "${CARCH}" == "i686" ];then
		_RUNNAME="${_pkgname}_Linux32"
	elif [ "${CARCH}" == "x86_64" ];then
		_RUNNAME="${_pkgname}_Linux64"
	fi
	sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_RUNNAME}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
	gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
	mkdir -p "${srcdir}/opt/${pkgname%-bin}/logfiles"
	bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
	rm -rf "${srcdir}/opt/${pkgname%-bin}/"*.{bat,exe}
	for _logtxt in app ai1 ai2 ai3 ai4;do
		touch "${srcdir}/opt/${pkgname%-bin}/logfiles/log.${_logtxt}.txt"
	done
	touch "${srcdir}/opt/${pkgname%-bin}/log.profiler.txt"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	cp -r "${srcdir}/opt" "${pkgdir}"
	install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENCE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	chmod 777 "${pkgdir}/opt/${pkgname%-bin}/savegames"
	find "${pkgdir}/opt/${pkgname%-bin}/logfiles" -name "log.*.txt" -perm 644 -exec chmod 666 {} \;
}