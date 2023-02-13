#Maintainer: sukanka<su975853527 [AT] gmail.com>

pkgname=('mtxx-bin')
_pkgname="mtxx"
pkgver=2.0.4
pkgrel=1
pkgdesc="美图秀秀, An image editing software that is mostly used in Mainland China"
provides=($_pkgname)
url="https://xiuxiu.web.meitu.com/"
arch=('x86_64')
license=('unknown')
provides=("${_pkgname}")
depends=('qt5-webkit' 'hicolor-icon-theme' 'freeimage' 'libyuv')
makedepends=('patchelf')
source_x86_64=("${_pkgname}-${pkgver}-amd64.deb::https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.meitu.mtxx/com.meitu.mtxx_${pkgver}_amd64.deb"
)
# source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://xiuxiu.dl.meitu.com/com.meitu.mtxx_${pkgver}_aarch64.deb")
sha512sums_x86_64=('6c9bb0ae54914a5366413c74c3637b6f30917922e1b4d6f5935a5e8a3df81fcb17e111b6b2033bde2481b9162b02e6435384d3d58b831dc3a5883ffaa25b74c8')
# sha512sums_aarch64=('14daff100f015854076def6ab7a6a05e2e18b08f5536479d5d022589294de2a402c8905cc3600d1c89339443245abb3093300b59919ba57ea46d32dcd5e669ef')
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

    sed -i "s|^Exec=.*|Exec=${_pkgname} %U|g" com.meitu.mtxx.desktop
    sed -i "s|^Icon=.*|Icon=${_pkgname}|g"          com.meitu.mtxx.desktop

    cd ${pkgdir}/opt/${_pkgname}
    rm *.sh mosaicpen/*.txt .DS_Store env post* *.pem

    mkdir ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}


}
