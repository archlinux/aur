# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=22.1.2.3
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/zwcad_${pkgver:0:2}_zh-cn_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/zwcad_${pkgver:0:2}_zh-cn_arm64.deb")
sha512sums_x86_64=('0a0393e94804a4537e314cc6d04a1e6e3da60c193071bb8fdf9bac220a77e6682c4faafe69de6ccb40a7a8e1c97ac174ff2bb4e99732f42ab53e4c650a97900c')
sha512sums_aarch64=('22a56b93504178d2fe13fecfb37b368747c24cc64174231aff3735257434da95e3dd0e8aaa895301a7da9d751d4ca7a38ab14acd66ec1c6aabbfb28498b723fa')

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
