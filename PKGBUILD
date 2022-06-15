# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname='gstarcad-bin'
_pkgname='gstarcad'
pkgver=2.4_2022.3.16
_pkgver=22sp1
pkgrel=1
epoch=1
pkgdesc="浩辰 CAD"
arch=('x86_64' 'aarch64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=(${_pkgname})
depends=('qt5-svg' 'qt5-imageformats' 'hicolor-icon-theme')
optdepends=('deepin-qt5integration: deepin DE integration')
makedepends=('patchelf')
source=('gcad.sh')
source_x86_64=("${pkgname}-${pkgver}-x86-64.deb::https://hccad.gstarcad.cn/linux${pkgver:4:4}/v${pkgver}/uos/com.gstarcad${pkgver:4:4}.cad_${_pkgver}_amd64.deb")
sha512sums=('f7d6c9af07a570c00c48d51ba6d248c34c880a402cebe3c6d0e0b5458a0b12055164b1fc057250807ec45fc0bdd34696c15169b3fc37240832d98f6fffa289e4')
sha512sums_x86_64=('9150289f84fce3476aa27f2301c4a5d2387ae95b8a945db6acd348a3a515e8994a174d84adf18db5b8254cd61c74674c17075e21066818d85f15e91cc9bd596f')
sha512sums_aarch64=('9150289f84fce3476aa27f2301c4a5d2387ae95b8a945db6acd348a3a515e8994a174d84adf18db5b8254cd61c74674c17075e21066818d85f15e91cc9bd596f')
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://hccad.gstarcad.cn/linux${pkgver:4:4}/v${pkgver}/uos/com.gstarcad${pkgver:4:4}.cad_${_pkgver}_amd64.deb")
# options=(!strip)
prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
    cd $srcdir/opt/apps/com.gstarcad${pkgver:4:4}.cad/entries
    sed -i "s|^Exec=.*|Exec=gcad %F|g;s|^Icon=.*|Icon=gcad|g" applications/*.desktop
}

package(){
    
    mkdir -p ${pkgdir}/usr/
    cp -rf  $srcdir/opt/apps/com.gstarcad${pkgver:4:4}.cad/entries ${pkgdir}/usr/share
    rmdir ${pkgdir}/usr/share/autostart 
    
    mkdir -p "$pkgdir"/opt/
    cp -rf  $srcdir/opt/apps/com.gstarcad${pkgver:4:4}.cad/files   "$pkgdir"/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/lib/${_pkgname}
    
    mv "$pkgdir"/opt/${_pkgname}/{*.so,*.tx,*.txv,drivers/*.so}  ${pkgdir}/usr/lib/${_pkgname}/

    # create executable
    install -Dm755 ${srcdir}/gcad.sh ${pkgdir}/usr/bin/gcad
    
#     patchelf --set-rpath '$ORIGIN/drivers:/usr/lib/gstarcad' "$pkgdir"/opt/${_pkgname}/gcad
#     strip ${pkgdir}/usr/lib/gstarcad/* || true
#     patchelf --add-rpath '$ORIGIN' "$pkgdir"/opt/${_pkgname}/gcad
    
    install -Dm644 "$pkgdir"/opt/${_pkgname}/*.xml -t ${pkgdir}/usr/share/mime/application
    # remove unused files
    rm -rf "$pkgdir"/opt/${_pkgname}/{platforminputcontexts,qtplugins,systemlibs,properties-xml-new/*.txt}
    rm -rf "$pkgdir"/opt/${_pkgname}/{gcad.{png,log,ico},qt.conf,*.xml,*.sh,Qt*}
}
