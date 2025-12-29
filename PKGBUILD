# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: WhriedPlanck
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: h0cheung <unknow>
# Contributor: WhiredPlanck <unknow>
# Contributor: heavysink <unknow>
pkgbase=yozo-office
_pkgname=Yozo_Office
pkgname=(
    "${pkgbase}"
    "${pkgbase}-fonts"
    "${pkgbase}-templates"
)
pkgver=9.0.6589.141ZH.S1
_relver=20251224_134417_869690
pkgrel=1
pkgdesc="Yozo Office 2024 - An MS Office compatible office suite"
url="https://www.yozosoft.com/product-officelinux.html"
options=(
    '!strip'
)
license=('LicenseRef-custom')
arch=('x86_64')
source=("${pkgbase}-${pkgver}.deb::https://dl.yozosoft.com/yozo/project/file/${_relver}/${pkgbase}_${pkgver}_amd64.deb")
sha256sums=('495375f2d122fb362ca7deb971f800a6090993deb77dbb4ae86624dcae098567')
prepare() {
    cd "${srcdir}"
    # Extracting data.tar.xz ...
    bsdtar -xf "${srcdir}/data."*
    # Fixing directory permissions ...
    find "${srcdir}" -type d -exec chmod -v 755 {} +
    # Removing unnecessary files ...
    rm -rf "${srcdir}/etc/"{xdg,yozoXpack}
    rm -rf "${srcdir}/opt/apps/${_pkgname}/"{Upgrade,uninstall}
    rm -rf "${srcdir}/usr/share/applications/yozo-uninstall.desktop"
}
package_yozo-office() {
    depends=(
        'freetype2'
        'sane'
        'libvlc'
        'libxt'
        'libsm'
        'libxkbcommon'
        'alsa-lib'
        'libglvnd'
        'libwebp'
        'gtk3'
        'mesa'
        'libmng'
        'nspr'
        'libpng12'
        'twolame'
        'libice'
        'nss'
        'sdl12-compat'
    )
    optdepends=(
        "${pkgbase}-fonts: built-in fonts"
        "${pkgbase}-templates: built-in document templates"
    )
    # Installing main binaries ...
    cp -Pr --no-preserve=ownership "${srcdir}"/{usr,opt,etc} "${pkgdir}"
    rm -rf "${pkgdir}/usr/share/fonts"
    rm -rf "${pkgdir}/opt/apps/${_pkgname}/Templates"
    # Fixing permissions of binaries in /usr/bin ...
    find "${pkgdir}/usr/bin" -type f -exec chmod -v 755 {} +
    # Replacing libfreetype.so.6 with system's to adapt for harfbuzz 5.x
    #rm -rf "${pkgdir}/opt/Yozosoft/${_pkgname}/Jre/lib/amd64/libfreetype.so.6"
    #ln -sf "/usr/lib/libfreetype.so.6" "${pkgdir}/opt/Yozosoft/${_pkgname}/Jre/lib/amd64/libfreetype.so.6"
    # Installing licenses of thirdparties ...
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/thirdpartylicensereadme.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
package_yozo-office-fonts() {
    pkgdesc="Built-in fonts of Yozo Office 2024"
    # Installing built-in fonts of Yozo Office 2024 ...
    install -Dm644 "${srcdir}/usr/share/fonts/truetype/yozo/"* -t "${pkgdir}/usr/share/fonts/truetype/yozo"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/thirdpartylicensereadme.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
package_yozo-office-templates() {
    pkgdesc="Built-in document templates of Yozo Office 2024"
    # Installing built-in document templates of Yozo Office 2024 ...
    install -Dm755 -d "${pkgdir}/opt/Yozosoft/${_pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_pkgname}/Templates" "${pkgdir}/opt/Yozosoft/${_pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/thirdpartylicensereadme.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
