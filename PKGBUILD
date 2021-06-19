# Maintainer sakura1943 <1436700265@qq.com>

pkgname='zw3d-bin'
_pkgname='zw3d'
_pkgname_o='com.zwsoft.zw3dpreview'
pkgver=2022.26.00
_year=$(echo $pkgver | cut -d '.' -f1)
##pkgrel
pkgrel=2.0
pkgdesc="国内首款支持Linux系统的三维CAD软件"
arch=('x86_64')
depends=('libjbig-shared')
license=('unknown')
url="https://www.zwsoft.cn/product/zw3d/linux"
provides=("zw3d")
options=('!strip')
intall=zw3d-bin.install
source=("${pkgname}-${pkgver}-${arch}.deb::https://download.zwcad.com/zw3d/3d_linux/preview/${_year}/ZW3D-${_year}-Preview-V1_amd64.deb")
sha512sums=('e9f3c062b4f859dee806ba0fc624ebc6b9f813d2bbfd36092705aff1a7daa35fd69ef3249381ea3392df4cc7f1087b9612d094bd4ea1ad899f0d2665a6ab4203')

prepare(){
    cd $srcdir
    tar -xJvf data.tar.xz -C "${srcdir}"
}

package(){
    mkdir -p "${pkgdir}"/opt
    mv "${srcdir}"/usr   "${pkgdir}"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    mv "${srcdir}"/opt/apps/${_pkgname_o} "${pkgdir}"/opt/${_pkgname_o}
    mv "${pkgdir}"/opt/${_pkgname_o}/entries/icons/hicolor/scalable/apps/*.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    
    
    sed -i '5c Exec=zw3d %F'   "$pkgdir/usr/share/applications/${_pkgname_o}.desktop"
    sed -i '6c Icon=ZW3Dpreview'     "$pkgdir/usr/share/applications/${_pkgname_o}.desktop"
    
    # create executable
    mkdir -p "$pkgdir"/usr/bin/
    
    echo '''#!/bin/bash
_pkgname_o='com.zwsoft.zw3dpreview'
run_path="/opt/${_pkgname_o}/files"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$run_path/lib:$run_path/lib/xlator:$run_path/libqt:$run_path/libqt/plugins/designer:$run_path/lib3rd
cd /opt/${_pkgname_o}/files

./zw3d $*

''' >"$pkgdir"/opt/${_pkgname_o}/zw3d 
    chmod 0755 "$pkgdir"/opt/${_pkgname_o}/zw3d
    
    ln -s /opt/${_pkgname_o}/zw3d "$pkgdir"/usr/bin/zw3d
}
