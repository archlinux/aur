# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=21.5.0.3
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11')
provides=("$_pkgname")
install=wind-bin.install
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.wind.wft/com.wind.wft_${pkgver}_amd64.deb")


sha512sums=('38f03e37b39b721d56fb7ee705a9441e9a7427497bf21b3f892bd40988e4ba2df093110d0a4594782074579bf23d036362d90b276475a4a77259e8616dec9a7c')

prepare(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${srcdir}"

}
package(){
    cd $srcdir
    mkdir -p $pkgdir/opt
    mv usr $pkgdir/
    mv opt/apps/com.wind.wft/files   ${pkgdir}/opt/wind
    mv opt/apps/com.wind.wft/entries/* ${pkgdir}/usr/share
    
    sed -i "3,4c Exec=wind \nIcon=com.wind.wft" \
    $pkgdir/usr/share/applications/com.wind.wft.desktop
    
    cd ${pkgdir}/opt/wind
    
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=/opt/wind/lib:/opt/wind/lib/3rd:/opt/wind/wbrowser:$LD_LIBRARY_PATH
cd /opt/wind/bin
LD_PRELOAD=./libjemalloc.so  ./wmain

''' >"$pkgdir"/opt/wind/wind
    
    chmod a+x $pkgdir/opt/wind/wind
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/wind/wind $pkgdir/usr/bin/wind
    
}
 
