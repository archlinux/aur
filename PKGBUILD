# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# contributor <su975853527 at gmail dot com>
pkgname=gstarcad-bin
_pkgname="gstarsoft.${pkgname%-bin}2027"
pkgver=27.0
pkgrel=1
pkgdesc="浩辰 CAD.Free trial for 30 days"
arch=(
    'aarch64'
    'x86_64'
)
license=('LicenseRef-custom')
url="https://www.gstarcad.com/cad_linux"
_dlurl="https://official-cn.gstarcad.cn"
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'qt5-svg'
    'curl'
    'sqlite'
    'nss'
    'lcms2'
    'nspr'
    'alsa-lib'
    'libxslt'
    'libxcomposite'
    'gtest'
    'freetype2'
    'libglvnd'
    'libcups'
    'libxdamage'
    'libtiff5'
    'libdrm'
    'libice'
    'libxshmfence'
    'xcb-util-image'
    'libxxf86vm'
    'libxkbcommon'
    'xdg-utils'
    'libsm'
    'xcb-util-wm'
    'fontconfig'
    'libxkbcommon-x11'
    'harfbuzz'
    'xcb-util-renderutil'
    'expat'
    'hicolor-icon-theme'
)
source=("${pkgname%-bin}.sh")
sha256sums=('2144610f35cf3891232da4fec7ed1ca1499d6688e2db0586508d088b47530c1f')
prepare(){
    local _deb_url_x86_64="${_dlurl}/linux/2027/gstarsoft.${pkgname%-bin}2026_${pkgver}_58amd64.deb"
    local _deb_url_aarch64="${_dlurl}/linux/2027/gstarsoft.${pkgname%-bin}2026_${pkgver}_58arm64.deb"
    local _referer_url="https://www.gstarcad.com/download-thanks/linux/207/1/"
    case "${CARCH}" in
        x86_64)
            _deb_url="${_deb_url_x86_64}"
            _referer_url="${_referer_url}262/"
            _deb_file="${pkgname%-bin}-${pkgver}-x86_64.deb"
            _sha256sum_expected='711de665cb954b5c28166faa08be6e76554650390236f6678068d0c80465afa9'
            ;;
        aarch64)
            _deb_url="${_deb_url_aarch64}"
            _referer_url="${_referer_url}263/"
            _deb_file="${pkgname%-bin}-${pkgver}-aarch64.deb"
            _sha256sum_expected='bbc7a5f68d32877fbfa39162550c209e4fc1a0e18b12fc5682947abed03f95f9'
            ;;
    esac
    if [[ ! -f "${srcdir}/${_deb_file}" ]]; then
        msg2 "正在下载 ${_deb_file} ..."
        curl -L -o "${srcdir}/${_deb_file}" -H "Referer: ${_referer_url}" "${_deb_url}"
    fi
    msg2 "验证 ${_deb_file} 校验和..."
    echo "${_sha256sum_expected}  ${srcdir}/${_deb_file}" | sha256sum -c || {
        msg2 "校验和不匹配，重新下载..."
        curl -L -o "${srcdir}/${_deb_file}" -H "Referer: ${_referer_url}" "${_deb_url}"
        echo "${_sha256sum_expected}  ${srcdir}/${_deb_file}" | sha256sum -c
    }
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/gcad/g
    " "${srcdir}/${pkgname%-bin}.sh"
    #bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.deb"
    #bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/bash\ \/opt\/apps\/${_pkgname}\/files\/gclauncher.sh/${pkgname%-bin}/g
        s/\/opt\/apps\/${_pkgname}\/files\/ImageRes\/gcad.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/etc/udev/rules.d/80-elite5.rules" -t "${pkgdir}/etc/udev/rules.d"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/apps/${_pkgname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/ImageRes/gcad.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    cp -a "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/about/zh-CN/"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
