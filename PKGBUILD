# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=22.0.2.4
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/zwcad_${pkgver}_zh-cn_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/zwcad_${pkgver}_zh-cn_arm64.deb")
sha512sums_x86_64=('a78335be694f9a2efd82319356e8e480fd10ee90dd032ad266318697505e54cf88ce1acdd4f71dd0ba7d1b6a26971a164344d90c4b711fbde03e6127e708995a')
sha512sums_aarch64=('aeb74a0426497ae8ce176f7c239b9163bb5d997cecffe19b7093bcfde902e471c42c3b79b933ff85eff42c1b9e162ba304ee0d052fc41d3ec336f1c87733cde1')

prepare(){
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p "$pkgdir"/opt
    mv "${srcdir}"/usr   "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    mv "${srcdir}"/opt/ZWSOFT/ZWCAD${_year} "${pkgdir}"/opt/zwcad
    mv "${pkgdir}"/opt/zwcad/Icons/ZWCAD.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    
    
    sed -i '5c Exec=zwcad %F'   "$pkgdir/usr/share/applications/ZWCAD${_year}.desktop"
    sed -i '21c Icon=ZWCAD'     "$pkgdir/usr/share/applications/ZWCAD${_year}.desktop"
    
    sed -i '5c Exec=zwlmgr'     "$pkgdir/usr/share/applications/ZwLmgr${_year}.desktop"
    # create executable
    mkdir -p "$pkgdir"/usr/bin/
    
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/zwcad:/opt/zwcad/lib:/opt/zwcad/lib/mono/lib
export MONO_PATH=$MONO_PATH:/opt/zwcad/lib/mono/lib/mono/4.5
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM_PLUGIN_PATH=/opt/zwcad/plugins
export QT_PLUGIN_PATH=/opt/zwcad/plugins
export QT_QPA_PLATFORM=xcb
cd /opt/zwcad/
#./ZWCAD -platformpluginpath /opt/zwcad/plugins -platform xcb "$1"
./ZWCAD "$1" "$2"

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
