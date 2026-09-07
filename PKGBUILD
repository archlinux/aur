# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=remarkable-remember
pkgname="${_appname}-bin"
_pkgname=reMarkableRemember
_debname="dev.schneider.${_appname//-/}"
pkgver=1.10.0
pkgrel=1
pkgdesc="A cross-platform management application for your reMarkable tablet."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ds160/remarkable-remember"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ds160/remarkable-remember/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ce46b168873c89cd7f1cedacb8791829c17cfd7fcf9ea837d4cacb08ad96ea73'
            '9887c2b5cc4171f8768feae7da23aa6765eaa859434757d416fb8988a36936c8')
sha256sums_aarch64=('4edcb2e59303572e096514644358e644651bb22ed93762f12983570901e9de86')
sha256sums_x86_64=('6bf86d6efebe2d805f17c384d996579332f79099c9c203670126223b6cb863a6')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname//reM/ReM}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_debname}\/${_pkgname//reM/ReM}/${pkgname%-bin}/g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_debname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
