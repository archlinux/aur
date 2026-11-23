# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuview-bin
_pkgname=YUView
_appname="de.rwth_aachen.ient.${_pkgname}"
pkgver=2.16
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset."
arch=('x86_64')
url="http://ient.github.io/YUView"
_ghurl="https://github.com/IENT/YUView"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'qt6-base'
	'hicolor-icon-theme'
)
makedepends=(
	'python3'
)
options=("!strip")
source=(
	"${pkgname%-bin}-${pkgver}.flatpak::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.flatpak"
    "yufpak_unpack.py"
	"${pkgname%-bin}.sh"
)
sha256sums=('088a3aab4b09fa8cc81e4d8ef7491859692fbd8e5619e79756114af9b8ebd731'
            'e9ccc53d7547948350effc4d1ae5689f9f387ca391cda64390d3d50ee4330a39'
            '216b754c5be3b7d33ebc915743a3bc4d6663a63b0a07468c88cc26bf20908cb4')
prepare() {
	sed -i -e "
		s/@appname@/${pkgname%-bin}/g
		s/@runname@/${_pkgname}/g
	" "${srcdir}/${pkgname%-bin}.sh"
	python3 "${srcdir}/yufpak_unpack.py" "${srcdir}/${pkgname%-bin}-${pkgver}.flatpak" "${srcdir}"
	sed -i -e "
		s/${_pkgname} %F/${pkgname%-bin} %F/g
		s/${_appname}/${pkgname%-bin}/g
	" "${srcdir}/YUView.desktop"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname}"
	install -Dm755 "${srcdir}/lib_"*.so "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libde265.so"
	for _icons in 32x32 48x48 64x64 128x128 256x256 512x512;do
		install -Dm644 "${srcdir}/icon_${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
	done
	install -Dm644 "${srcdir}/YUView.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	install -Dm644 "${srcdir}/yuview.mime.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
	install -Dm644 "${srcdir}/yuview.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
}