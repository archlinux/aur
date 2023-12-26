# Contributor: taotieren <admin@taotieren.com>

pkgname=jlc-assistant-bin
pkgver=5.0.69
pkgrel=14
pkgdesc="嘉立创下单助手:该应用为您下单提供便利，快速获取优惠及下单信息，无需在网站等待审核审单！在下单助手下单立享打折优惠！ "
arch=('x86_64')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('custom')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=(${pkgname%-bin})
depends=(gtk3 nss libxss electron libappindicator-gtk3 libnotify)
makedepends=()
backup=()
options=()
install=
source=("${pkgname%-bin}-${pkgver}.zip::https://download.jlc.com/pcAssit/${pkgver}/JLCPcAssit-linux-x64-${pkgver}.zip")
sha256sums=('d943ebf9ee328a657cd608bdf301f637ea48988b57adeae1ae770fae944caacd')
noextract=()

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/usr/lib/${pkgname%-bin}/"

    # electron file
    install -dm0755 "${pkgdir}/usr/lib/${pkgname%-bin}/"
    cd ${srcdir}/${pkgname%-bin}-linux-x64-${pkgver}/${pkgname%-bin}/
    cp -r res ${pkgdir}/usr/lib/${pkgname%-bin}
    cp -r resources ${pkgdir}/usr/lib/${pkgname%-bin}

    # icon
    local _icon
    for _icon in 16 32 64 72 128 256 512;
    do
        install -Dm0644 icon/png/${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-bin}.png
    done

     # desktop entry
    install -Dm0644 ${pkgname%-bin}.dkt \
                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    sed -i 's|/opt/jlc-assistant/icon/png/128.png|jlc-assistant.png|g' \
                                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop
    sed -i 's|/opt/jlc-assistant/||g' ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    # jlc-assistant file
    install -Dm0755 /dev/stdin ${pkgdir}/usr/bin/${pkgname%-bin} << EOF
#!/bin/sh

exec electron /usr/lib/jlc-assistant/resources/app.asar " \$@"
EOF

    # LICENSE
#     install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE


}
