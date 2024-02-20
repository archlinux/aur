# Maintainer: taotieren <admin@taotieren.com>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgbase=lceda-pro
pkgname=lceda-pro
pkgver=2.1.49.1
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
sha256sums_x86_64=('87b70157f59b089a045b7245e31b33a85535d33cc753aa2f74dfe9bbcdead8fe')
sha256sums_aarch64=('e5edc4342fe40fc9a694ecbb8e6bba0e69b03a6985419518204e7e2dbab5d7b7')
sha256sums_loong64=('a9aef1f15df005e2bc5fdf51ad560c7633c47174fb91e63e117a02a346a813b6')

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
