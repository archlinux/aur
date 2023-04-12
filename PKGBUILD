# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="game-box-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="An Old-gen console games emulator. This project only relies on the Qt framework.一款游戏家用机模拟器,仅依赖Qt框架"
arch=('x86_64')
url="https://github.com/QQxiaoming/game_box"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('freetype2' 'hicolor-icon-theme' 'e2fsprogs' 'fontconfig' 'sh' 'libxcb' 'libx11' 'libgpg-error' 'zlib' \
    'gcc-libs' 'libdrm' 'mesa' 'glibc' 'libglvnd')
options=(!strip)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/V0.1.0/game_box_ubuntu2004_V010_x86_64.tar.gz"
    "${pkgname%-bin}16.png::${url}/raw/main/img/icon16.png"
    "${pkgname%-bin}32.png::${url}/raw/main/img/icon32.png"
    "${pkgname%-bin}64.png::${url}/raw/main/img/icon64.png"
    "${pkgname%-bin}128.png::${url}/raw/main/img/icon128.png"
    "${pkgname%-bin}256.png::${url}/raw/main/img/icon256.png")
sha256sums=('f031db78f85ea318b17fd617823fa512990cf29879ed01a7989a88094130933e'
            '37585cab200f91674bc563c02a7ec9d5b055f705b2c1bffd56e7c22f004d9352'
            'bdb95e2f3caf71f492a1d31ef5260fbe390e37ed2d350b948cd6dea179c3e006'
            '0be01b83f0d0cb1f17def0feeedf4f0e99e3b0c80c102232bf60f3bed4f4cb8a'
            '6595d331c8a0c9194b76f2eb72475fcd54ea86c443c70afcc790d857b68c6fb9'
            '8410145a23e7c9bd51ada0ac251783079903ab8c3de44c500cf05f91b9745fac')
package() {
    install -Dm 755 -d "${pkgdir}/opt"
    bsdtar -xvf "${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt/" --gname root --uname root
    mv "${pkgdir}/opt/game_box_ubuntu2004" "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}"
    find "${pkgdir}" -name "._*" -exec rm -rf {} \;
    sed 's|SHELL_FOLDER=\$(cd "$(dirname "\$0")";pwd)|SHELL_FOLDER=/opt/game-box|g;s|./game_box|/opt/game-box/game_box|g' -i "${pkgdir}/opt/${pkgname%-bin}/game_box.sh"
    gendesk -f --pkgname "${pkgname}" --pkgdesc "An Old-gen console games emulator. This project only relies on the Qt framework.一款游戏家用机模拟器,仅依赖Qt框架" \
        --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/game_box.sh"
    for _icons in 16x16 32x32 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}"/${pkgname%-bin}${_icons/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}