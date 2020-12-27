# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=2021.0.2884
_year=$(echo $pkgver | cut -d '.' -f1)
pkgrel=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}.deb::http://download.zwcad.com/zwcad/cad_linux/${_year}/deb/x64/zwcad_${pkgver}-1_zh-cn_amd64.deb")
sha512sums_x86_64=('1b2324eb487982e7b929f0cd2abd8ba14e3e6c2c7a89e5e554456d40d3a68608f125bf291dcb24803b9480b16ecb6f18952913b21bde50a4922aa88cc69eff76')

source_aarch64=("${pkgname}-${pkgver}.deb::http://download.zwcad.com/zwcad/cad_linux/${_year}/deb/arm/zwcad_${pkgver}-1_zh-cn_arm64.deb")
sha512sums_aarch64=('b7333ed86e9e6e9bb8966116dc3ead34915b427050cd81b83184f789e6e041d5aca57d410d378962a71d07c0eece26e336ad729741e0eeafd45a1294faa8d6c5')

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
