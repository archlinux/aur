# Maintainer: Chapman <chapman.arch@gmail.com>
# Contributor: WeChat Linux Community

pkgname=tencent-wechat
pkgver=4.1.13.23
pkgrel=1
pkgdesc="Tencent WeChat (Linux) with native Wayland support and privacy sandbox (Community Repackage)"
arch=('x86_64')
url="https://linux.weixin.qq.com/"
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bubblewrap'
    'cairo'
    'dbus'
    'expat'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libdrm'
    'libglvnd'
    'libpulse'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxrandr'
    'libxrender'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'zlib'
)
optdepends=(
    'noto-fonts-cjk: Chinese font support'
    'ttf-twemoji: Emoji display support'
    'xdg-desktop-portal: Desktop portal integration for file dialogs and notifications'
)
provides=('wechat' 'wechat-universal')
conflicts=('wechat' 'wechat-universal-bwrap' 'wechat-bin')
options=(!debug !strip)

source=(
    "wechat.sh"
    "wechat.desktop"
    "LICENSE"
    "DISCLAIMER"
)
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.deb::https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb"
)
noextract=("${pkgname}-${pkgver}-x86_64.deb")

sha256sums=(
    '39e83e6f486fb8e44d6af37040fdab873654b970b790a20e427361695a001fff'
    'd2dbcae549dbeba5feb8bf9dea1be06a767032a5078358d7e7395a9d5cb5fd0a'
    'c7d3a19e099ba6e6f33d90a35891a443fdd01c62f424e31e21c955fd03168b63'
    '3f02a485084d1d7ecd0dc6b787240fd234d168f051b60456a023e8a841d5bb4b'
)
sha256sums_x86_64=(
    '096865e050ba0d3c1a23887227e2400bf343037b1d7d658c84c88ff26bfdc17f'
)

prepare() {
    bsdtar -xf "${pkgname}-${pkgver}-x86_64.deb" data.tar.xz
}

package() {
    # Extract opt and usr hierarchies from official deb data
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # Install pixmap for launchers that search /usr/share/pixmaps
    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wechat.png" "${pkgdir}/usr/share/pixmaps/wechat.png"

    # Replace upstream launcher with our native Wayland + privacy sandbox launcher
    install -Dm755 "${srcdir}/wechat.sh" "${pkgdir}/usr/bin/wechat"

    # Install clean, non-universal desktop entry
    install -Dm644 "${srcdir}/wechat.desktop" "${pkgdir}/usr/share/applications/wechat.desktop"

    # Ensure correct executable permissions
    chmod 755 "${pkgdir}/opt/wechat/wechat"

    # Install license and disclaimer
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/DISCLAIMER" "${pkgdir}/usr/share/licenses/${pkgname}/DISCLAIMER"
}
