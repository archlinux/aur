# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgbase=lceda-pro
pkgname=lceda-pro
pkgver=1.9.23
pkgrel=1
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://pro.lceda.cn/"
license=('custom' 'Commercial')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(lceda-pro-bin)
depends=(gtk3 nss alsa-lib electron libappindicator-gtk3 libnotify)
makedepends=()
backup=()
options=()
install=${pkgname}.install
source=("LICENSE"
        "${pkgname}.install")
source_x86_64=("${pkgname}-x86_64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip")
source_aarch64=("${pkgname}-aarch64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-${pkgver}.zip")
source_loong64=("${pkgname}-loong64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-loong64-${pkgver}.zip")
sha256sums=('9b53bc19a98498c86019cc32a3ade6ad0ee4b12ba30686feb93132a5f0da52f5'
            'f8c3c7f65443801b8a70e40de7cdceade5dcd75974945695dd5a1bfb1f862e1a')
sha256sums_x86_64=('d0749914f985f9ad882eb9c30c13fd04d26b450125f1d485550518098cf3f6cc')
sha256sums_aarch64=('432b6686323ae82427c6cb34ad0df1e71ea6cf8fe6701f6d1c16ef2a90520cc9')
sha256sums_loong64=('0dbfaf5ea81670659432bd807b443dc44182be7ab02cbcc7ca420f931f802edd')

# prepare() {
#     # Change src path name
#     if [ ${CARCH} = "x86_64" ]; then
#         mv ${pkgname}-linux-x64 ${pkgname}-linux
#     fi
#     if [ ${CARCH} = "aarch64" ]; then
#        mv  ${pkgname}-linux-arm64 ${pkgname}-linux
#     fi
#     if [ ${CARCH} = "loong64" ]; then
#        mv  ${pkgname}-linux-loong64 ${pkgname}-linux
#     fi
# }

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    # electron file
    install -dm0755 "${pkgdir}/usr/lib/${pkgname}/"

    cd ${srcdir}/${pkgname}/
    cp -r resources ${pkgdir}/usr/lib/${pkgname}

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm0644 icon/icon_${_icon}x${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png
    done
    install -Dm644 icon/icon_512x512@2x.png \
                   ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png

    # desktop entry
    install -Dm0644 lceda-pro.dkt \
                    ${pkgdir}/usr/share/applications/${pkgname}.desktop

    sed -i 's|/opt/lceda-pro/icon/icon_128x128.png|lceda-pro|g' \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop
    sed -i 's|/opt/lceda-pro/||g' \
        ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # lceda-pro file
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname} << EOF
#!/bin/sh

exec electron /usr/lib/lceda-pro/resources/app/ "\$@"
EOF
    # LICENSE
    install -Dm0644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm0644 LCEDA-Distribution-License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LCEDA-DLA.txt
}
