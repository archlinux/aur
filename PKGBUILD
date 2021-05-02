# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=2021.1.4523
_year=$(echo $pkgver | cut -d '.' -f1)
pkgrel=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/${pkgver:7}/zwcad_${pkgver}-1_zh-cn_amd64.deb")
sha512sums_x86_64=('1b7a70252c2718bc0d3f93ddc2fda561d8c593c64c9375ef5f20ad6cc2cd36370c9740c60d9715e0df0c37160a12a4ecdc7717ca51d71a058ce48521800a3cfa')
sha512sums_aarch64=('9845fcc430883a7586c04c68ab929ca1e71cd68a7e616ae24c1cd269f5231023efb3750a49c5d90739daca53f3d80a950f25057b9512246e32f8868d075d9c65')

source_aarch64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/${pkgver:7}/zwcad_${pkgver}-1_zh-cn_arm64.deb")

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p "$pkgdir"/opt
    mv "${srcdir}"/usr   "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    mv "${srcdir}"/opt/ZWSOFT/ZWCAD2021 "${pkgdir}"/opt/zwcad
    mv "${pkgdir}"/opt/zwcad/Icons/ZWCAD.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    
    
    sed -i '5c Exec=zwcad %F'   "$pkgdir/usr/share/applications/ZWCAD${_year}.desktop"
    sed -i '21c Icon=ZWCAD'     "$pkgdir/usr/share/applications/ZWCAD${_year}.desktop"
    
    sed -i '5c Exec=zwlmgr'     "$pkgdir/usr/share/applications/ZwLmgr${_year}.desktop"
    # create executable
    mkdir -p "$pkgdir"/usr/bin/
    
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/zwcad:/opt/zwcad/lib
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/zwcad/plugins
export QT_PLUGIN_PATH=/opt/zwcad/plugins
export QT_QPA_PLATFORM=xcb
cd /opt/zwcad/
#./ZWCAD -platformpluginpath /opt/zwcad/plugins -platform xcb "$1"
./ZWCAD "$1"

''' >"$pkgdir"/opt/zwcad/zwcad 
    chmod 0755 "$pkgdir"/opt/zwcad/zwcad 
    
    cp "$pkgdir"/opt/zwcad/zwcad  "$pkgdir"/opt/zwcad/zwlmgr
    sed -i "s/ZWCAD/ZwLmgr/g" "$pkgdir"/opt/zwcad/zwlmgr
    ln -s /opt/zwcad/zwcad "$pkgdir"/usr/bin/zwcad
    ln -s /opt/zwcad/zwlmgr "$pkgdir"/usr/bin/zwlmgr
    
    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/Icons
    rm -rf "$pkgdir"/opt/zwcad/ZWCADRUN.sh
    rm -rf "$pkgdir"/opt/zwcad/ZWLMGRRUN.sh
}
