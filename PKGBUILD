# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=noi
pkgname="${_appname}-desktop-bin"
_pkgname=Noi
pkgver=0.4.0
_electronversion=29
pkgrel=5
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_linux_amd64_${pkgver}.deb"
)
sha256sums=('80921cf6a68aac06ef1051dfd23573e040bedabf17f90717bafe7085ec0fd928')
prepare() {
    bsdtar -xf "${srcdir}/data."*
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
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/lib/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
