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
replaces=('yozo-office-2019')
conflicts=('yozo-office-2019')
source_x86_64=("http://www.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb")
md5sums_x86_64=('cf22531071e607019c02a1a046f70e5c')

package_yozo-office() {
    depends=('java-runtime=8' 'libxt' 'libxmu' 'gtk2' 'libglvnd' 'vlc')
    optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
    		    'ttf-ms-win10-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.'
                'yozo-office-fonts: UI Fonts')
    install=${pkgname}.install
    cd "${srcdir}"
    tar -xJf data.tar.xz -C "${pkgdir}"
    chmod 755 $pkgdir/usr/lib
    chmod 755 $pkgdir/usr/lib64
    chmod 755 $pkgdir/usr
    chmod 755 $pkgdir/usr/bin
    #Delete uesless files
    cd "${pkgdir}"
    rm -rf etc/xdg
    rm -rf etc/skel
    rm -rf opt/Yozosoft/Yozo_Office/Upgrade
    rm -rf opt/Yozosoft/Yozo_Office/uninstall
    rm -rf usr/lib64
    rm -rf usr/share/mime
    rm -rf usr/share/applications/yozo-uninstall.desktop
    rm -rf opt/Yozosoft/Yozo_Office/Templates
    #Split fonts files
    cd "${srcdir}"
    mkdir -p usr/share/fonts/truetype
    mv "${pkgdir}"/usr/share/fonts/truetype/yozo usr/share/fonts/truetype
    
    #Redirect Java bin
    rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    ln -sf /usr/lib/jvm/java-8-openjdk/jre/bin "${pkgdir}"/opt/Yozosoft/Yozo_Office/Jre/bin
    cd $pkgdir/opt/Yozosoft/Yozo_Office/Jre/lib
    for j in *; do
        if [ "$j" != "ext" ]; then
            rm -rf $j
        fi
    done
    #Redirect VLC lib
    #mkdir -p "${pkgdir}"/usr/lib/Yozo_Office/
    #mv "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/* "${pkgdir}"/usr/lib/Yozo_Office
    rm -rf "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/media/vlc
    ln -sf /usr/lib/vlc "${pkgdir}"/opt/Yozosoft/Yozo_Office/Lib/media/vlc
    
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
