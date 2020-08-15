# Maintainer: WhriedPlanck
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: h0cheung <unknow>
# Contributor: WhiredPlanck <unknow>
# Contributor: heavysink <unknow>

pkgbase=yozo-office
pkgname=('yozo-office' 'yozo-office-fonts')
pkgver=8.0.1331.101ZH.S1
pkgrel=2
pkgdesc="永中办公 2019 | Yozo Office 2019 - An M$ Office Compatible Office Suite"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!strip')
license=("custom")
arch=('x86_64')
source_x86_64=("https://dl.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb")
sha256sums_x86_64=('0896ca9d4b7163e769ba0be0da0862ed4322dabb18909a3309822832d0047d8f')

prepare() {
    cd "${srcdir}"
    tar -xJf data.tar.xz # -C "${pkgdir}"
    # Premission fix
    find "${srcdir}" -type d -exec chmod 755 {} +
    
    # Remove unnecessary files
    cd "${srcdir}"
    rm -rf etc/xdg
    rm -rf etc/skel
    rm -rf opt/Yozosoft/Yozo_Office/Upgrade
    rm -rf opt/Yozosoft/Yozo_Office/uninstall
    rm -rf usr/lib64
    rm -rf usr/share/mime
    rm -rf usr/share/applications/yozo-uninstall.desktop
    rm -rf opt/Yozosoft/Yozo_Office/Templates
}
package_yozo-office() {
    depends=('java-runtime=8' 'libxt' 'libxmu' 'gtk2' 'libglvnd')
    optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
    		    'ttf-ms-win10-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.'
                'yozo-office-fonts: UI Fonts')
    install=${pkgname}.install
    
    # Move to pkgdir
    cd "${srcdir}"
    cp -r usr opt etc "${pkgdir}"
    
    # Separate font files
    rm -rf "${pkgdir}"/usr/share/fonts
    
    # Redirect Java binary
    rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    ln -sf /usr/lib/jvm/java-8-openjdk/jre/bin "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    cd $pkgdir/opt/Yozosoft/Yozo_Office/Jre/lib
    for j in *; do
        if [ "$j" != "ext" ]; then
            rm -rf $j
        fi
    done
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
    pkgdesc="永中办公界面字体 | UI Fonts provided by Yozo Office 2019"
    cd "${srcdir}"
    mkdir -p "${pkgdir}"/usr/share/fonts/truetype
    mv usr/share/fonts/truetype/yozo "${pkgdir}"/usr/share/fonts/truetype
}
