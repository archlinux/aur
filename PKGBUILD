#Maintainer: sukanka<su975853527 [AT] gmail.com>

pkgname=('mtxx-bin')
_pkgname="mtxx"
pkgver=2.0.1
pkgrel=1
pkgdesc="美图秀秀, An image editing software that is mostly used in Mainland China"
provides=($_pkgname)
url="https://xiuxiu.web.meitu.com/"
arch=('x86_64')
license=('unknown')
provides=("${_pkgname}")
depends=('qt5-webkit' 'hicolor-icon-theme' 'freeimage' 'libyuv')
makedepends=('patchelf')
source=("${_pkgname}-${pkgver}.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.meitu.mtxx/com.meitu.mtxx_${pkgver}_amd64.deb"
)
sha512sums=('3e7efe1e4db39bea866d84d151ca9503dfee4917bdcddf153de31d0d590fe3e44d10736ae7265750a076c6723fd0c80ad755dca91409667baf9f79d2aebf1b5b')
options=(!strip)
prepare(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${srcdir}"
    cd opt/apps/com.meitu.mtxx/files/mtxx
    patchelf --add-rpath "$ORIGIN/../lib/mtxx" mtxx
    
    cd ${srcdir}/opt/apps/com.meitu.mtxx/entries
    rm -rf .DS_Store icons/.DS_Store
}
package(){
    cd ${srcdir}/opt/apps/com.meitu.mtxx
    mkdir ${pkgdir}/opt
    install -Dm755 files/mtxx/libMT*  -t ${pkgdir}/usr/lib/${_pkgname}
    cp -rf entries          ${pkgdir}/usr/share
    rm -rf files/mtxx/lib*
    cp -rf files/mtxx        ${pkgdir}/opt/${_pkgname}
    
    cd ${pkgdir}/usr/share/applications/
    
    sed -i "6c Exec=${_pkgname} %U" com.meitu.mtxx.desktop
    sed -i "11c Icon=MTXX"          com.meitu.mtxx.desktop
    
    cd ${pkgdir}/opt/${_pkgname}
    rm *.sh mosaicpen/*.txt .DS_Store env post* *.pem 
    
    mkdir ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

	 
}
