# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
pkgver=5.0.1446
pkgrel=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('libbsd' 'qt5-svg' 'gtk2')
source=("${pkgname}-${pkgver}.deb::http://download.zwcad.com/zwcad/cad_linux/preinst/deb/x64/uos/com.zwsoft.zwcad_${pkgver}-1_amd64.deb")
sha512sums=('3a8230b0d494bc59a7ce26d307305b7f52e3edef237da19e6344682607c452b31ecd4dae1061537418445bd02d40d9f56ed2a73ced1e1f2b9ab10f0d53cac26f')

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p "$pkgdir"/usr/share/
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/applications   "$pkgdir"/usr/share/applications
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/icons          "$pkgdir"/usr/share/icons
#     mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/mime       "$pkgdir"/usr/share/mime
    
    sed -i '6c Exec=zwcad %F'   "$pkgdir"/usr/share/applications/com.zwsoft.zwcad.desktop
    sed -i '9c Icon=ZWCAD'      "$pkgdir"/usr/share/applications/com.zwsoft.zwcad.desktop
    
    mkdir -p "$pkgdir"/opt/zwcad/
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/files/*     "$pkgdir"/opt/zwcad/
    
    # create executable
    mkdir -p "$pkgdir"/usr/bin/
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/opt/zwcad":"/opt/zwcad/lib"
/opt/zwcad/ZWCAD -platformpluginpath /opt/zwcad/plugins -platform xcb "$1"
''' >"$pkgdir"/usr/bin/zwcad 
    chmod 0755 "$pkgdir"/usr/bin/zwcad 
    
    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/Icons
#     rm -rf "$pkgdir"/opt/zwcad/lib
#     rm -rf "$pkgdir"/opt/zwcad/plugins
    rm -rf "$pkgdir"/opt/zwcad/ZWCADRUN.sh
    rm -rf "$pkgdir"/opt/zwcad/qt.conf
}
