# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgbase=lceda-pro
pkgname=lceda-pro
pkgver=1.9.20
pkgrel=2
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=('x86_64' 'aarch64')
url="https://pro.lceda.cn/"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(lceda-pro-bin)
depends=(gtk3 nss alsa-lib)
makedepends=(libarchive)
backup=()
options=()
install=${pkgname}.install
source=("LICENSE"
        "${pkgname}.install")
source_x86_64=("${pkgname}-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-${pkgver}.zip")
sha256sums=('9b53bc19a98498c86019cc32a3ade6ad0ee4b12ba30686feb93132a5f0da52f5'
            'f8c3c7f65443801b8a70e40de7cdceade5dcd75974945695dd5a1bfb1f862e1a')
sha256sums_x86_64=('a9f0191d2aafe6a995f96c9d0f7e295f155ee107fccee677d8f804303434c54f')
sha256sums_aarch64=('a9f0191d2aafe6a995f96c9d0f7e295f155ee107fccee677d8f804303434c54f')

# noextract=(${pkgname}-${pkgver}.zip)

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/${pkgname}/"

    #bsdtar xf "${srcdir}/${pkgname}-linux-x64.zip" --strip-components=1 -C  "${pkgdir}/opt/${pkgname}"
    #bsdtar xf "${srcdir}/${pkgname}-linux-x64.zip" -C  "${pkgdir}/opt/${pkgname}"
    mv ${srcdir}/${pkgname}-linux-x64/* ${pkgdir}/opt/${pkgname}

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm0644 ${pkgdir}/opt/${pkgname}/icon/icon_${_icon}x${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png
    done
    install -Dm644 ${pkgdir}/opt/${pkgname}/icon/icon_512x512@2x.png \
                   ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png
    rm -rf ${pkgdir}/opt/${pkgname}/icon

    # desktop entry
    install -Dm0644 ${pkgdir}/opt/${pkgname}/LCEDA-PRO.dkt \
                    ${pkgdir}/usr/share/applications/${pkgname}.desktop

    sed -i 's|/opt/lceda-pro/icon/icon_128x128.png|lceda-pro|g' \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    sed -i 's|/opt/lceda-pro/||g' \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    rm -rf ${pkgdir}/opt/${pkgname}/LCEDA-PRO.dkt

    # soft link
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 "{}" \;

    install -dm0755 ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
    chmod 0755 ${pkgdir}/opt/${pkgname}/${pkgname}

    # LICENSE
    install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm0644 "${pkgdir}/opt/${pkgname}/嘉立创EDA分发许可协议.txt" ${pkgdir}/usr/share/licenses/${pkgname}/LCEDA_DLA.txt
}
