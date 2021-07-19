# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname='gstarcad-bin'
_pkgname='gstarcad'
pkgver=20210719
pkgrel=1
pkgdesc="浩辰 CAD"
arch=('x86_64' 'aarch64')
license=('custom')
url="https://www.gstarcad.com/cad_linux/"
provides=(${_pkgname})
depends=('qt5-svg' 'qt5-imageformats' 'hicolor-icon-theme')
optdepends=('deepin-qt5integration: deepin DE integration')
source_x86_64=("${pkgname}-${pkgver}-${arch}.deb::https://hccad.gstarcad.cn/linux${pkgver:0:4}/V2.1/com.gstarcad.cad_21sp-5_amd64_${pkgver:2:8}.deb")
sha512sums_x86_64=('236ce39ce1f0f4f35e241d73f00628451b2cfa88deb212dc7e106cccf32a59432eed166ac6af372865b38b4b5fd12ef4cc1093dbb5dfce220d7f35cc8643291a')
sha512sums_aarch64=('236ce39ce1f0f4f35e241d73f00628451b2cfa88deb212dc7e106cccf32a59432eed166ac6af372865b38b4b5fd12ef4cc1093dbb5dfce220d7f35cc8643291a')
source_aarch64=("${pkgname}-${pkgver}-${arch}.deb::https://hccad.gstarcad.cn/linux${pkgver:0:4}/V2.1/com.gstarcad.cad_21sp-5_arm64_${pkgver:2:8}.deb")

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
