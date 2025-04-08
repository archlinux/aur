# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=utools-bin
_pkgname=uTools
pkgver=7.0.0
_electronversion=22
pkgrel=1
pkgdesc="uTools Utilities.(Prebuilt version)新一代效率工具平台,自由组合插件应用,打造专属你的趁手工具集"
arch=("x86_64")
url="https://u.tools"
_ghurl="https://github.com/uTools-Labs"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://open.u-tools.cn/download/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.html::${url}/agreement.html"
)
sha256sums=('f44b93b77ea9046d6992c5ee15b8f167649c864c6d2b5b548b8a4c0db7decf9d'
            '986625f2970528f051391a41b1ede526de70c896209fc5bf818934b88cc12cfd')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/opt/${_pkgname}/${_files}"
	done
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
    ln -sf "/opt/${_pkgname}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}