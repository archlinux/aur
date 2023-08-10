# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aechoterm-bin
_pkgname=Aechoterm
pkgver=4.0.0
pkgrel=5
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=('aarch64' 'x86_64')
url="https://ec.nantian.com.cn/"
_githuburl="https://github.com/Aechoterm/Aechoterm"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rar::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-linux._arm64.rar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rar::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-linux._amd64.rar")
sha256sums=('e8f1e294d1152576e54ca0231728baa2987bf371a34be268d0fd48e823ee12c2')
sha256sums_aarch64=('c595f42c9794ddaa461944446619bcfe482d388694e4368bafd99a1bb971771c')
sha256sums_x86_64=('66eb40c664495bdc509e541580465fb9089088590ccd836a36cfb3d1c9d6589c')
package() {
    bsdtar -xf "${srcdir}/${_pkgname}_${pkgver}"*.deb
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|/opt/${_pkgname}/${pkgname%-bin} --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}