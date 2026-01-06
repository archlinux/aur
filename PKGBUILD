# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=noi
pkgname="${_appname}-desktop-bin"
_pkgname=Noi
pkgver=1.0.0
_electronversion=39
pkgrel=1
pkgdesc="Power Your World with AI - Explore, Extend, Empower.(Prebuilt version)"
arch=('x86_64')
url="https://noi.nofwl.com/"
_ghurl="https://github.com/lencx/Noi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('3dae652b18a1d16bbc68f51ea28ba032c1a4efa36f93518998581661fb11dd1a')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${_appname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    _get_electron_version
    sed -i -e "
        s/${_appname}/${pkgname%-bin}/g
        6i\StartupWMClass=${_pkgname}
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/usr/lib/${_appname}/${_files}"
	done
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_appname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_appname}/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}