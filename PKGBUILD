# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname='foxitpdfeditor-bin'
_pkgname='foxitpdfeditor'
pkgver=12.0.2.1118
pkgrel=1
pkgdesc="Foxit PDF editor 福昕高级PDF编辑器"
arch=('x86_64')
license=('unknown')
url="https://www.foxitsoftware.cn"
depends=('qt5-base' 'qt5-webengine' 'qt5-speech' 'icu66')
makedepends=('patchelf')
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch}.deb::https://cdn07.foxitsoftware.cn/pub/foxit/phantomPDF/desktop/win/${pkgver:0:2}.x/${pkgver:0:4}/zh_cn/${pkgver:0:6}/com.foxit.foxitpdfeditor_${pkgver}_amd64.deb"
"${_pkgname}.sh"
"https://mirrors.bfsu.edu.cn/archlinux-archive/2021/10-04/extra/os/x86_64/libvpx-1.10.0-1-x86_64.pkg.tar.zst"
)
sha512sums_x86_64=('a43a0416e82b995c413a4dca163018d634c1c7390c06eac6ae80da2263328cc2a293875b0b55e0a8e633e14658acfc48efd36993fa15128aaf778090b3886670'
                   'f877489dcb72be7e9762f067804b6b1216c19233203c866f4c0029d9b02da38e2294bb0fafef3511d909434e4151ce66cf49fb4d75a4cb3cb7732e9fa4076d39'
                   'c05e876965f38007b65869b3d74c366ff749a3bc5ca91907d687a61e96aa38520b4d01e1fdefa4ebcca8cdb5eb8d6c70fc1ea5dc1969f1d45fd12f73d572d92c')
prepare(){
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"
    cd $srcdir/opt/apps/com.foxit.${_pkgname}/files
    sed -i "s|^Exec.*|Exec=${_pkgname} %F|" com.foxit.${_pkgname}.desktop
    sed -i "s|^Icon.*|Icon=FoxitPDFEditor|" com.foxit.${_pkgname}.desktop

    sed -i "s|^Exec.*|Exec=foxitpdfeditor-activator %F|" Activation.desktop
    sed -i "s|^Icon.*|Icon=FoxitPDFEditorActivate|" Activation.desktop
    mv Activation.desktop foxitpdfeditor-activator.desktop

    rm -rf  Update.desktop

}


package(){
    cd $srcdir
    install -Dm755 $srcdir/${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    ln -s /opt/${_pkgname}/Activation.sh   ${pkgdir}/usr/bin/foxitpdfeditor-activator

    mkdir -p ${pkgdir}/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/share/

    cd  $srcdir/opt/apps/com.foxit.${_pkgname}
    cp -rf files/* ${pkgdir}/opt/${_pkgname}

    cd ${pkgdir}/opt/${_pkgname}

    install -d ${pkgdir}/usr/share/mime/packages
    mv resource/mime/*  ${pkgdir}/usr/share/mime/packages

    # icons
    install -d ${pkgdir}/usr/share/icons/hicolor
    mv resource/icons/* ${pkgdir}/usr/share/icons/hicolor

    install -Dm644 images/FoxitPDFEditorActivate.png -t ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
    install -Dm644 *.desktop -t ${pkgdir}/usr/share/applications

    # patchelf
    patchelf --set-rpath '/usr/lib/office6' WpsOfficeToPdf

    for lib in $(ls fxplugins/*.so)
    do
        patchelf --set-rpath '$ORIGIN' "$lib"
    done
    patchelf --remove-rpath  'Activation' 'countinstalltion'  'installUpdate' 'updater'

    # libvpx
    cp -rf ${srcdir}/usr/lib/libvpx* ${pkgdir}/opt/${_pkgname}/lib

    rm -rf *.sh *.desktop postinst prerm  images
}
