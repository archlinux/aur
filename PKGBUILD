# Maintainer: WhriedPlanck
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: h0cheung <unknow>
# Contributor: WhiredPlanck <unknow>
# Contributor: heavysink <unknow>

pkgbase=yozo-office
pkgname=('yozo-office' 'yozo-office-fonts' 'yozo-office-templates')
pkgver=8.0.1331.101ZH.S1
pkgrel=3
pkgdesc="永中办公 2019 | Yozo Office 2019 - An M$ Office Compatible Office Suite"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!strip')
license=("custom: yozo")
arch=('x86_64')
source=("https://dl.yozosoft.com/yozo/project/file/20210415_094030_900850/yozo-office_8.0.1331.101ZH.S1_amd64.deb")
# "https://dl.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb"
sha256sums=('0896ca9d4b7163e769ba0be0da0862ed4322dabb18909a3309822832d0047d8f')

prepare() {
    mkdir -p "${srcdir}"/temp
    bsdtar --acls --xattrs -xpf data.tar.xz -C "${srcdir}"/temp

    # Premission fix
    find "${srcdir}" -type d -exec chmod 755 {} +
    
    # Remove unnecessary files
    cd "${srcdir}"/temp
    rm -rf etc/xdg
    rm -rf etc/skel
    rm -rf opt/Yozosoft/Yozo_Office/Upgrade
    rm -rf opt/Yozosoft/Yozo_Office/uninstall
    rm -rf usr/lib64
    rm -rf usr/share/applications/yozo-uninstall.desktop
}
package_yozo-office() {
    depends=('glibc>=2.3' 'libx11' 'libxext' 'libxi' 'libxt'
             'libxtst' 'libxmu' 'libxau' 'libcups' 'libxcb')
    optdepends=('yozo-office-fonts: UI Fonts'
                'yozo-office-templates: Built-in Document Templates')
    install=${pkgname}.install
    
    # Copy to pkgdir
    cd "${srcdir}"/temp
    cp -r usr opt etc "${pkgdir}"
    
    # Separate font files and built-in templates
    rm -rf "${pkgdir}"/usr/share/fonts
    rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Templates
    
    # Redirect Java binary
    # rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    # ln -sf /usr/lib/jvm/java-8-openjdk/jre/bin "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    # cd $pkgdir/opt/Yozosoft/Yozo_Office/Jre/lib
    # for j in *; do
    #    if [ "$j" != "ext" ]; then
    #        rm -rf $j
    #    fi
    # done

    # Redirect VLC lib
    #mkdir -p "${pkgdir}"/usr/lib/Yozo_Office/
    #mv "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/* "${pkgdir}"/usr/lib/Yozo_Office
    #rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/media/vlc
    #ln -sf /usr/lib/vlc "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/media/vlc
    
    install -Dm644 "${pkgdir}"/opt/Yozosoft/Yozo_Office/thirdpartylicensereadme.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    
#    targetP="${pkgdir}/opt/Yozosoft/Yozo_Office"
#    unpackP="${targetP}/Jre/bin/unpack200"
#    libP="${targetP}/Jre/lib"
}

package_yozo-office-fonts() {
    pkgdesc="永中办公界面字体 | UI Fonts for Yozo Office 2019"
    cd "${srcdir}"/temp
    mkdir -p "${pkgdir}"/usr/share/fonts/truetype
    cp -r usr/share/fonts/truetype/yozo "${pkgdir}"/usr/share/fonts/truetype
}

package_yozo-office-templates() {
    pkgdesc="永中办公内置模板 | Yozo Office 2019 Built-in Document Templates"
    cd "${srcdir}"/temp
    mkdir -p "${pkgdir}"/opt/Yozosoft/Yozo_Office
    cp -r opt/Yozosoft/Yozo_Office/Templates "${pkgdir}"/opt/Yozosoft/Yozo_Office
}
