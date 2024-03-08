# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgbase=lceda-pro
pkgname=lceda-pro
pkgver=2.1.51
pkgrel=1
pkgdesc="免费、专业、强大的国产PCB设计工具"
arch=('x86_64' 'aarch64' 'loong64')
url="https://pro.lceda.cn/"
license=('LicenseRef-LCEDA-Proprietary')
depends=(electron
         gtk3
         nss
         alsa-lib
         libpulse
         bash
         hicolor-icon-theme
         gcc-libs
         coreutils
         glibc)
install=${pkgname}.install
source=("LICENSE-$pkgver.html::https://lceda.cn/page/legal"
        "${pkgname}.install")
source_x86_64=("${pkgname}-x86_64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-x64-${pkgver}.zip")
source_aarch64=("${pkgname}-aarch64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-arm64-${pkgver}.zip")
source_loong64=("${pkgname}-loong64-${pkgver}.zip::https://image.lceda.cn/files/lceda-pro-linux-loong64-${pkgver}.zip")
sha256sums=('SKIP'
            'afba3c6712227a37c08783b3cc1a97ae71e90dc2f575409213d2773372220697')
sha256sums_x86_64=('97640631ce248bfc9a98f2258249612462650e603a867cb9a109c03879494fd3')
sha256sums_aarch64=('2bc6a69ae1fce7cd59257a93c4b23620e72a8f7f4f54b4c224c056db6d938458')
sha256sums_loong64=('afc0d4690f0b6352aa68a832210e6c97e23d105ed01a178b0f842b1386fcf30d')

package() {
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
    install -Dm0644 ${srcdir}/LICENSE-$pkgver.html ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html
}
