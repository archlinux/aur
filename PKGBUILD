# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname='gstarcad-bin'
_pkgname='gstarcad'
pkgver=20211020
_pkgver=22sp
pkgrel=1
pkgdesc="浩辰 CAD"
arch=('x86_64' 'aarch64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=(${_pkgname})
depends=('qt5-svg' 'qt5-imageformats' 'hicolor-icon-theme')
optdepends=('deepin-qt5integration: deepin DE integration')
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://hccad.gstarcad.cn/linux20${_pkgver:0:2}/v2.3/uos/com.gstarcad.cad_${_pkgver}_amd64.deb")
sha512sums_x86_64=('0fc458dcd349d4b2400a17e7d9ae858df9b42f453975d33c24bc654cbd6c695780a6b83faa7b17bd4604bcc3637dcea588a5c738ce1fd4d9f5976080ad01705a')
sha512sums_aarch64=('9a4c35d23b108c4bd2e550acaf6d15d8f4ef9c53e173042d3d53bfdd7f45129e54f4145c66b58151fbdc9f43035fb95bdf8c4948716f4390be0c2941a1dab59f')
source_aarch64=("${pkgname}-${pkgver}-${arch}.deb::https://hccad.gstarcad.cn/linux20${_pkgver:0:2}/v2.3/uos/com.gstarcad.cad_${_pkgver}_arm64.deb")

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    
    mkdir -p ${pkgdir}/usr/
    mv $srcdir/opt/apps/com.gstarcad.cad/entries ${pkgdir}/usr/share
    
    cd ${pkgdir}/usr/share
    rmdir autostart 
    
    
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
