#Maintainer: h0cheung <unknow>
#Maintainer: WhiredPlanck <unknow>
#Contributor：heavysink <unknow>

pkgbase=yozo-office-2019
pkgname=('yozo-office-2019-bin' 'yozo-office-2019-fonts')
_pkgver=8.0.1331.101ZH.S1
pkgver=8.0.1331.101ZH.S1
pkgrel=3
pkgdesc="Yozo Office 2019 - An M$ Office Compatible Office Suit"
url="https://www.yozosoft.com/product-officelinux.html"
options=('!emptydirs'
         '!strip')
license=("custom")
arch=('x86_64') 
provides=('yozo-office')
conflicts=('yozo-office')
source_x86_64=("http://www.yozosoft.com/portal-download/fileManager/PRODUCT/yozo-office_${pkgver}_amd64.deb")
md5sums_x86_64=('cf22531071e607019c02a1a046f70e5c')

prepare() {
    cd "${srcdir}"
    bsdtar -xpf data.tar.xz
}

package_yozo-office-2019-bin() {
    depends=('jre8-openjdk-headless' 'libxtst' 'libxt')
    optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
    			'ttf-ms-win10-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.'
    			'yozo-office-2019-fonts: UI Fonts'
    			'yozo-office-2019-templates: Templates files')
    install=${pkgname}.install
    cd "${srcdir}"
    mv etc opt usr "${pkgdir}"
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
    install -d usr/share/fonts/truetype
    mv "${pkgdir}/usr/share/fonts/truetype/yozo" usr/share/fonts/truetype
    
    #Replace Java bin
    rm -rf "${pkgdir}/opt/Yozosoft/Yozo_Office/Jre/bin"
    ln -sf /usr/lib/jvm/java-8-openjdk/jre/bin "${pkgdir}/opt/Yozosoft/Yozo_Office/Jre/bin"
    cd $pkgdir/opt/Yozosoft/Yozo_Office/Jre/lib
    for j in *; do
        if [ "$j" != "ext" ]; then
            rm -rf $j
        fi
    done

    targetP="${pkgdir}/opt/Yozosoft/Yozo_Office"
    unpackP="${targetP}/Jre/bin/unpack200"
    libP="${targetP}/Jre/lib"
}

package_yozo-office-2019-fonts() {
    pkgdesc="Fonts provided by Yozo Office 2019"
    cd "${srcdir}"
    install -d "${pkgdir}/usr/share/fonts/truetype"
    mv usr/share/fonts/truetype/yozo "${pkgdir}/usr/share/fonts/truetype"
}

