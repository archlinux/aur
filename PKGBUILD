# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=lceda-pro-bin
pkgver=1.7.31
pkgrel=3
pkgdesc="立创EDA专业版，专业、强大的国产PCB设计工具，永久免费全新的交互式布线引擎，流畅，不卡顿，完全的独立自主知识产权，让您放心专注于设计，下一代工程师的首选EDA工具"
arch=('x86_64')
url="https://pro.lceda.cn/"
license=('custom')
provides=(${pkgname})
conflicts=(${pkgname%-bin} ${pkgname/-bin/-git})
#replaces=(${pkgname})
depends=('gtk3' 'nss' 'libxss')
makedepends=('libarchive')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${pkgname%-bin}-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip"
        "LICENSE"
        "${pkgname}.install")
sha256sums=('d878a38833028271e748da0897bea6cdf10f80ef542b1083c618f6aa509356fd'
            '9b53bc19a98498c86019cc32a3ade6ad0ee4b12ba30686feb93132a5f0da52f5'
            'f8c3c7f65443801b8a70e40de7cdceade5dcd75974945695dd5a1bfb1f862e1a')
# noextract=(${pkgname%-bin}-${pkgver}.zip)

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/${pkgname%-bin}/"

    #bsdtar xf "${srcdir}/${pkgname%-bin}-linux-x64.zip" --strip-components=1 -C  "${pkgdir}/opt/${pkgname%-bin}"
    #bsdtar xf "${srcdir}/${pkgname%-bin}-linux-x64.zip" -C  "${pkgdir}/opt/${pkgname%-bin}"
    mv ${srcdir}/${pkgname%-bin}-linux-x64/* ${pkgdir}/opt/${pkgname%-bin}

    # icon
    local _icon
    for _icon in 16 32 64 128 256;
    do
        install -Dm0644 ${pkgdir}/opt/${pkgname%-bin}/icon/icon_${_icon}x${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-bin}.png
    done
    rm -rf ${pkgdir}/opt/${pkgname%-bin}/icon

    # desktop entry
    install -Dm0644 ${pkgdir}/opt/${pkgname%-bin}/LCEDA-PRO.dkt \
                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    sed -i 's|/opt/lceda-pro/icon/icon_128x128.png|lceda-pro|g' \
                                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop
    sed -i 's|/opt/lceda-pro/||g' ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    rm -rf ${pkgdir}/opt/${pkgname%-bin}/LCEDA-PRO.dkt

    # soft link
    find "${pkgdir}/opt/${pkgname%-bin}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 "{}" \;

    install -dm0755 ${pkgdir}/usr/bin
    ln -s /opt/${pkgname%-bin}/${pkgname%-bin} ${pkgdir}/usr/bin/${pkgname%-bin}
    chmod 0755 ${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}

    # LICENSE
    install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE


}
