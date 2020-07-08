# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
pkgver=3.0.102
pkgrel=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('qt5-base' 'hicolor-icon-theme' 'glu')
source=("${pkgname}-${pkgver}.deb::https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.zwsoft.zwcad/com.zwsoft.zwcad_${pkgver}-${pkgrel}_amd64.deb")
sha512sums=('b4a0bc7351a323f396a645731c9af95361752b7fee1b92711610b4b938bc499f34ff580aee54c953ff0cfd1afb72062213001b35d7ab7cd80d4df05f400594a4')

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
    echo -e '#!/bin/bash\nexport LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/opt/zwcad"\n/opt/zwcad/ZWCAD
    '  > "$pkgdir"/usr/bin/zwcad 
    chmod 0755 "$pkgdir"/usr/bin/zwcad 

    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/qt
    rm -rf "$pkgdir"/opt/zwcad/platform*
    rm -rf "$pkgdir"/opt/zwcad/ZWCADRUN.sh
}
