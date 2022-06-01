# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=22.2.3.5
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('freeimage' 'qrencode'  'freetype2' 'python')
source_x86_64=("${_pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/SP2/zwcad${_year}_${pkgver}_zh-cn_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zwcad/cad_linux/${_year}/SP2/zwcad${_year}_${pkgver}_zh-cn_arm64.deb")
sha512sums_x86_64=('445b0039355faa6516395492db6cc2f65e0e71b8e9ee5610aa96b08222b06aa918415b60492d3e7e5ae364ac39cf02f511611592a7d80eb3f8d3d960078744f8')
sha512sums_aarch64=('445b0039355faa6516395492db6cc2f65e0e71b8e9ee5610aa96b08222b06aa918415b60492d3e7e5ae364ac39cf02f511611592a7d80eb3f8d3d960078744f8')
options=(!strip)

prepare(){
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"
    cd $srcdir/opt/ZWSOFT/ZWCAD${_year}
    #system qt
    rm -rf lib/{libQt*,libpng*} plugins libpng*
    sed -i "4c Prefix = /usr/lib/qt" qt.conf
    
    #system python
    cd ZwPyRuntime
    _pyver=$(python -V | cut -d' ' -f2)
    test -d python${_pyver%.*} || mkdir python${_pyver%.*}
    cp python3.7/ZwPyRuntime.so python${_pyver%.*}
    rm -rf python3.{4,5,6,7}
    cd python${_pyver%.*}
    sed -i "s|libpython3.7m.so.1.0|libpython${_pyver%.*}.so.1.0|g" ZwPyRuntime.so
    
    cd $srcdir/opt/ZWSOFT/ZWCAD${_year}
    rm -rf libZwPythonLoad{4,5,6}.so
    _midver=$(echo ${_pyver} |cut  -d'.' -f2)
    mv libZwPythonLoad7.so libZwPythonLoad${_midver}.so
    sed -i 's|libpython3.7m.so.1.0|libpython${_pyver%.*}.so.1.0|g' libZwPythonLoad${_midver}.so
}
build(){
    cd $srcdir/opt/ZWSOFT/ZWCAD${_year}
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/zwcad:/opt/zwcad/lib:/opt/zwcad/lib/mono/lib
export MONO_PATH=$MONO_PATH:/opt/zwcad/lib/mono/lib/mono/4.5
export QT_IM_MODULE=fcitx
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins
export QT_PLUGIN_PATH=/usr/lib/qt/plugins
export QT_QPA_PLATFORM=xcb
export GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=1
cd /opt/zwcad/
#./ZWCAD -platformpluginpath /opt/zwcad/plugins -platform xcb "$1"
./ZWCAD "$1" "$2"

''' >zwcad 
    chmod 0755 zwcad 
    
    cp zwcad zwlmgr
    sed -i '$d' zwlmgr
    echo './ZwLmgr /language zh-CN /language zh-CN' >>zwlmgr
    
    # Fix ./ZWLMGRRUN.sh and ./ZWCADRUN.sh not found
    sed -i 's|ZWLMGRRUN.sh|zwlmgr\x0\x0\x0\x0\x0\x0|g' ZWCAD
    sed -i 's|ZWCADRUN.sh|zwcad\x0\x0\x0\x0\x0\x0|g' ZwLmgr
    
    # Fix desktop
    cd $srcdir/usr/share/applications/
    sed -i 's|^Exec=.*|Exec=zwcad %F|g;s|^Icon=.*|Icon=ZWCAD|g'   "ZWCAD${_year}.desktop"
    sed -i 's|^Exec=.*|Exec=zwlmgr|g;s|^Icon=.*|Icon=ZWCAD|g'   "ZwLmgr${_year}.desktop"
    
}

package(){
    mkdir -p "$pkgdir"/opt
    mv "${srcdir}"/usr   "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    mv "${srcdir}"/opt/ZWSOFT/ZWCAD${_year} "${pkgdir}"/opt/zwcad
    mv "${pkgdir}"/opt/zwcad/Icons/ZWCAD.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    
    # create executable
    cp "$pkgdir"/opt/zwcad/zwcad  "$pkgdir"/opt/zwcad/zwlmgr
    sed -i "s/ZWCAD/ZwLmgr/g" "$pkgdir"/opt/zwcad/zwlmgr
    mkdir -p "$pkgdir"/usr/bin/
    ln -s /opt/zwcad/zwcad "$pkgdir"/usr/bin/zwcad
    ln -s /opt/zwcad/zwlmgr "$pkgdir"/usr/bin/zwlmgr
    
    
    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/{Icons,ZWCADRUN.sh,ZWLMGRRUN.sh}
    rm -rf ${pkgdir}/opt/zwcad/{libfree*,libqren*}
    
    cd "$pkgdir"/opt/zwcad
    install -Dm644 sense4_usb.rules  ${pkgdir}/etc/udev/rules.d/sense4_usb.rules
    
}
