# Maintainer: wimpy <vvinn.py@gmail.com>
# Maintainer: devome <evinedeng@hotmail.com>
# Maintainer: Rsplwe <i@rsplwe.com>

_pkgname="wechat"
pkgname="${_pkgname}-bin"
pkgver=4.0.1.11
pkgrel=1
pkgdesc="WeChat from Tencent | 微信官方版"
arch=("x86_64" "aarch64" "loong64")
url="https://linux.weixin.qq.com"
license=("custom:Software License and Service of Tencent Weixin")
provides=("${_pkgname}"{,-universal})
conflicts=("${_pkgname}"{,-universal})
replaces=("${_pkgname}-universal"{,-privilege})
depends=(at-spi2-core jack libpulse libxcomposite libxdamage libxkbcommon-x11 libxrandr mesa nss pango xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm)
optdepends=("noto-fonts-cjk: Chinese font support"
            "noto-fonts-emoji: emoji support")
source=("LICENSE-zh_CN.html::https://weixin.qq.com/agreement?lang=zh_CN"
        "LICENSE-zh_HK.html::https://weixin.qq.com/agreement?lang=zh_HK"
        "LICENSE-zh_TW.html::https://weixin.qq.com/agreement?lang=zh_TW"
        "LICENSE-en.html::https://www.wechat.com/mobile/en/service_terms.html")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.deb")
source_loong64=("${_pkgname}-${pkgver}-loong64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_LoongArch.deb")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_loong64=('SKIP')
noextract=("${_pkgname}-${pkgver}-"{x86_64,aarch64,loong64}.deb)
options=("!strip")

prepare() {
    bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" data.tar.xz | bsdtar -xmf- --exclude usr/share/doc
    sed -e "s|^Icon=.*|Icon=${_pkgname}|" \
        -e "s|^Categories=.*|Categories=Network;InstantMessaging;Chat;|" \
        -e "s|^Exec=.*|Exec=env 'QT_QPA_PLATFORM=wayland;xcb' QT_AUTO_SCREEN_SCALE_FACTOR=1 /usr/bin/${_pkgname} %U|" \
        -i "usr/share/applications/${_pkgname}.desktop"
}

pkgver() {
    bsdtar -xOf "${_pkgname}-${pkgver}-${CARCH}.deb" control.tar.xz | bsdtar -xOf- control | awk '/Version: /{print $2}'
}

package() {
    mv {opt,usr} "${pkgdir}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
