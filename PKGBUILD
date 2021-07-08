# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=21.4.0.9
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11')
provides=("$_pkgname")
install=wind-bin.install
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.wind.wft/com.wind.wft_${pkgver}_amd64.deb")


sha512sums=('5c4949c5d8af4c6268d5cbff14831a54266d8de2c1ea7d077d936f78d8bbd33e57cb882496ec7a86e6797a772f2152b07cca641f6b079953b098edffadde263b')

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
 
