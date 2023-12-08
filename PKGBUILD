# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=lceda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.42
pkgrel=1
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://pro.lceda.cn/"
license=('custom')
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git)
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=()
backup=()
#options=('!strip')
install=${pkgname}.install
source=("LICENSE"
        "${pkgname}.install")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-${pkgver}.zip")
source_loong64=("${_pkgname}-loong64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-loong64-${pkgver}.zip")
sha256sums=('df9110f0949b869a922449d87e32b975c84b13122967bc18cd1b2cd58a18ab83'
            'f8c3c7f65443801b8a70e40de7cdceade5dcd75974945695dd5a1bfb1f862e1a')
sha256sums_x86_64=('4a6ded3805fda5bc78d426796d719bd598e96566d57e421223ef15391d97f65d')
sha256sums_aarch64=('7a656db15f2ff60c697e611c8b7d8394d50805f7de3fe3b194867cfacdeddf1c')
sha256sums_loong64=('35a8af2b0a5362ba7b70855406b5497c4cc64bc1f1ea2b88a0d1144e3876d940')

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/${_pkgname}/"

    cd "${srcdir}/${_pkgname}"
    mv * "${pkgdir}/opt/${_pkgname}/"

    cd "${pkgdir}/opt/${_pkgname}/"
    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm0644 "icon/icon_${_icon}x${_icon}.png" \
                        "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png"
    done
    install -Dm0644 "icon/icon_512x512@2x.png" \
                    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
    rm -rf icon

    # desktop entry
    install -Dm0644 lceda-pro.dkt \
                    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    sed -i 's|/opt/lceda-pro/icon/icon_128x128.png|lceda-pro|g' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i 's|/opt/lceda-pro/||g' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf lceda-pro.dkt

    # fix permissions
    find "${pkgdir}/opt/${_pkgname}/" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/${_pkgname}/" -type d -exec chmod 755 {} \;
    chmod 0755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    # soft link
    install -dm0755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${_pkgname}/${_pkgname}" \
          "${pkgdir}/usr/bin/${_pkgname}"

    # LICENSE
    install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 LCEDA-Distribution-License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LCEDA-DLA.txt"
}
