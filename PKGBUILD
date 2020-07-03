# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
pkgver=2.0.91
pkgrel=2
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('qt5-base' 'hicolor-icon-theme' 'glu')
source=("${pkgname}.deb::https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.zwsoft.zwcad/com.zwsoft.zwcad_${pkgver}-2_amd64.deb")
sha512sums=('a69fcab2fae3ced6deb2a03294bdad3cf673c5928e3c7f6efe651d6ff170ab7047481342f176520b16a7f673b95461f6c3de8c2432d3b075dd6f2e5e75bc8f61')

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p "$pkgdir"/usr/share/
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/applications   "$pkgdir"/usr/share/applications
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/icons          "$pkgdir"/usr/share/icons
    mv "${srcdir}"/opt/apps/com.zwsoft.zwcad/entries/mime       "$pkgdir"/usr/share/mime
    
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
