# Contributor: taotieren <admin@taotieren.com>

pkgname=jlc-assistant-bin
pkgver=5.0.69
pkgrel=1
pkgdesc="嘉立创下单助手:该应用为您下单提供便利，快速获取优惠及下单信息，无需在网站等待审核审单！在下单助手下单立享打折优惠！ "
arch=('x86_64')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('custom')
provides=(${pkgname})
conflicts=(${pkgname%-bin})
replaces=(${pkgname})
depends=(gtk3 nss libxss)
makedepends=(libarchive)
backup=()
options=('!strip')
install=
source=("${pkgname%-bin}-${pkgver}.zip::https://download.jlc.com/pcAssit/${pkgver}/JLCPcAssit-linux-x64-${pkgver}.zip")
sha256sums=('d943ebf9ee328a657cd608bdf301f637ea48988b57adeae1ae770fae944caacd')
noextract=(${pkgname%-bin}-${pkgver}.zip)

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm0755 "${pkgdir}/opt/${pkgname%-bin}/"

    bsdtar xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" --strip-components=2  -C  "${pkgdir}/opt/${pkgname%-bin}"

    # icon
    local _icon
    for _icon in 16 32 64 72 128 256 512;
    do
        install -Dm0644 ${pkgdir}/opt/${pkgname%-bin}/icon/png/${_icon}.png \
                        ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-bin}.png
    done
    rm -rf ${pkgdir}/opt/${pkgname%-bin}/icon

#     # desktop entry
    install -Dm0644 ${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.dkt \
                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    sed -i 's|/opt/jlc-assistant/icon/png/128.png|jlc-assistant.png|g' \
                                    ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop
    sed -i 's|/opt/jlc-assistant/||g' ${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop

    rm -rf ${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.dkt

    # soft link
    find "${pkgdir}/opt/${pkgname%-bin}" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 "{}" \;

    chmod 0755 ${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}
    install -dm0755 ${pkgdir}/usr/bin/
    ln -sf /opt/${pkgname%-bin}/${pkgname%-bin} ${pkgdir}/usr/bin/${pkgname%-bin}

    # LICENSE
#     install -Dm0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE


}
