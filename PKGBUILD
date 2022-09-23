# Maintainer: WhriedPlanck
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: h0cheung <unknow>
# Contributor: WhiredPlanck <unknow>
# Contributor: heavysink <unknow>

pkgbase=yozo-office
pkgname=('yozo-office' 'yozo-office-fonts' 'yozo-office-templates')
pkgver=8.0.1331.101ZH.S1
pkgrel=6
pkgdesc="Yozo Office 2019 - An M$ Office compatible office suite"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!strip')
license=('custom: yozo')
arch=('x86_64')
source=("https://dl.yozosoft.com/yozo/project/file/20210415_094030_900850/yozo-office_${pkgver}_amd64.deb")
sha256sums=('0896ca9d4b7163e769ba0be0da0862ed4322dabb18909a3309822832d0047d8f')

_info() { echo -e "[\e[96m$*\e[0m]"; }

prepare() {
    cd "${srcdir}"
    # Extracting data.tar.xz ...
    tar -xvpf data.tar.xz -C "${srcdir}"

    # Fixing directory permissions ...
    find "${srcdir}" -type d -exec chmod -v 755 {} +

    # Removing unnecessary files ...
    rm -rv "${srcdir}"/etc/{skel,xdg,yozoXpack}
    rm -rv "${srcdir}"/opt/Yozosoft/Yozo_Office/Upgrade
    rm -rv "${srcdir}"/opt/Yozosoft/Yozo_Office/uninstall
    rm -rv "${srcdir}"/usr/lib64
    rm -rv "${srcdir}"/usr/share/applications/yozo-uninstall.desktop
}
package_yozo-office() {
    depends=('gtk2' 'libxml2' 'hicolor-icon-theme' 'freetype2')
    optdepends=('yozo-office-fonts: built-in fonts'
                'yozo-office-templates: built-in document templates')
    
    cd "${srcdir}"
    # Installing main binaries ...
    cp -rv "$srcdir"/{usr,opt,etc} "${pkgdir}"
    
    # Separating built-in fonts and templates ...
    rm -rv "${pkgdir}"/usr/share/fonts
    rm -rv "${pkgdir}"/opt/Yozosoft/Yozo_Office/Templates

    # Fixing permissions of binaries in /usr/bin ...
    find "${pkgdir}"/usr/bin -type f -exec chmod -v 755 {} +

    # Replacing libfreetype.so.6 with system's to adapt for harfbuzz 5.x
    rm -rv "${pkgdir}/opt/Yozosoft/Yozo_Office/Jre/lib/amd64/libfreetype.so.6"
    ln -sv /usr/lib/libfreetype.so.6 \
        "${pkgdir}/opt/Yozosoft/Yozo_Office/Jre/lib/amd64/libfreetype.so.6"
    
    # Installing licenses of thirdparties ...
    install -Dvm644 "${pkgdir}"/opt/Yozosoft/Yozo_Office/thirdpartylicensereadme.txt \
        "${pkgdir}"/usr/share/licenses/${pkgname}/thirdpartylicensereadme.txt
}

package_yozo-office-fonts() {
    pkgdesc="Built-in fonts of Yozo Office 2019"
    cd "${srcdir}"
    # Installing built-in fonts of Yozo Office 2019 ...
    install -dvm644 "${pkgdir}"/usr/share/fonts/truetype
    cp -rv "${srcdir}"/usr/share/fonts/truetype/yozo \
        "${pkgdir}"/usr/share/fonts/truetype
}

package_yozo-office-templates() {
    pkgdesc="Built-in document templates of Yozo Office 2019"
    cd "${srcdir}"
    # Installing built-in document templates of Yozo Office 2019 ...
    install -dvm755 "${pkgdir}"/opt/Yozosoft/Yozo_Office
    cp -rv "${srcdir}"/opt/Yozosoft/Yozo_Office/Templates \
        "${pkgdir}"/opt/Yozosoft/Yozo_Office
}
