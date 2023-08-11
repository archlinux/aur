# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=game-box-bin
_appname=game_box
pkgver=0.1.0
pkgrel=3
pkgdesc="An Old-gen console games emulator. This project only relies on the Qt framework.一款游戏家用机模拟器,仅依赖Qt框架"
arch=('x86_64')
url="https://github.com/QQxiaoming/game_box"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('freetype2' 'hicolor-icon-theme' 'e2fsprogs' 'fontconfig' 'sh' 'libxcb' 'libx11' 'libgpg-error' 'zlib' \
    'gcc-libs' 'libdrm' 'mesa' 'glibc' 'libglvnd')
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/V0.1.0/${_appname}_ubuntu2004_V010_${CARCH}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/QQxiaoming/game_box/main/img/icon256.png")
sha256sums=('f031db78f85ea318b17fd617823fa512990cf29879ed01a7989a88094130933e'
            '8410145a23e7c9bd51ada0ac251783079903ab8c3de44c500cf05f91b9745fac')
package() {
    install -Dm 755 -d "${pkgdir}/opt"
    bsdtar -xvf "${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${_appname}_ubuntu2004" "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}"
    find "${pkgdir}" -name "._*" -exec rm -rf {} \;
    sed "s|SHELL_FOLDER=\$(cd \"\$(dirname \"\$0\")\";pwd)|SHELL_FOLDER=/opt/${pkgname%-bin}|g;s|./${_appname}|/opt/${pkgname%-bin}/${_appname}|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/${_appname}.sh"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility;Game" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${_appname}.sh"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}