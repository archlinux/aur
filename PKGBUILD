# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=lceda-pro-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.21
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
sha256sums=('e1c6b9641b73a56d5bffe42d8db2107af8f2c51aa5cd11c79aa998321a5e0190'
            'f8c3c7f65443801b8a70e40de7cdceade5dcd75974945695dd5a1bfb1f862e1a')
sha256sums_x86_64=('64a3e9595fe54f6467bb015b5bc3a5ae73109f0e39fc7b91fcb1536d1fdc8a52')
sha256sums_aarch64=('3ee36eb676b2e9a8cc0e1a46403d976c7948fa790f820960eca2087656c2c40c')
sha256sums_loong64=('e4b054ad52708bb9350e88c9eb09e16a06fb7a67117df7ac47cefd76be8166f5')

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
