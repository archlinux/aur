# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname='gstarcad-bin'
_pkgname='gstarcad'
pkgver=20210317
pkgrel=1
pkgdesc="浩辰 CAD"
arch=('x86_64' 'aarch64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=(${_pkgname})
depends=('qt5-svg' 'qt5-imageformats' 'hicolor-icon-theme')
optdepends=('deepin-qt5integration: deepin DE integration')
source=("${pkgname}-${pkgver}-${arch}.deb::https://hccad.gstarcad.cn/linux${pkgver:0:4}/GstarCAD${pkgver:0:4}_Linux_uos_amd64_v2.0_${pkgver}.deb")
sha512sums=('67dae72b64a99a6bea93488a78a534bd56215546d0cac38035a708c4e8570193684a5080d7141fcbcceb580388157e8630ce82d71dc976654dc53688e8a97ed6')

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    
    mkdir -p ${pkgdir}/usr/
    mv $srcdir/opt/apps/com.gstarcad.cad/entries ${pkgdir}/usr/share
    
    cd ${pkgdir}/usr/share
    rmdir autostart plugins services
    
    
    mkdir -p "$pkgdir"/opt/
    mv ${srcdir}/opt/apps/com.gstarcad.cad/files   "$pkgdir"/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/lib/${_pkgname}
    
    mv "$pkgdir"/opt/${_pkgname}/{*.so,*.tx,*.txv,drivers/*.so}  ${pkgdir}/usr/lib/${_pkgname}/
    
    sed -i '16c Exec=gstarcad %F'   "$pkgdir/usr/share/applications/com.${_pkgname}.cad.desktop"
    sed -i '17c Icon=gcad'     "$pkgdir/usr/share/applications/com.${_pkgname}.cad.desktop"
    
    # create executable
    mkdir -p "$pkgdir"/usr/bin/
    
    echo """#!/bin/bash
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/lib/${_pkgname}/
export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/${_pkgname}/
export XMODIFIERS=@im=fcitx  
export XIM=fcitx
export XIM_PROGRAM=fcitx  
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
/opt/${_pkgname}/gcad "\$@"
""" >"$pkgdir"/opt/${_pkgname}/${_pkgname}
    chmod 0755 "$pkgdir"/opt/${_pkgname}/${_pkgname}
    
    ln -s /opt/${_pkgname}/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
    
    sed -i '2c Plugins =/usr/lib/qt/plugins' "$pkgdir"/opt/${_pkgname}/qt.conf
    
    # remove unused files
    rm -rf "$pkgdir"/opt/${_pkgname}/{platforminputcontexts,qtplugins,systemlibs,properties-xml-new/*.txt}
    rm -rf "$pkgdir"/opt/${_pkgname}/{gcad.*}
}
