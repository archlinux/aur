# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='foxitpdfeditor-bin'
_pkgname='foxitpdfeditor'
pkgver=11.0.2.1222
pkgrel=1
pkgdesc="Foxit PDF editor 福昕高级PDF编辑器"
arch=('x86_64')
license=('unknown')
url="https://www.foxitsoftware.cn"
depends=('qt5-base' 'qt5-webengine' 'qt5-speech')
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch}.deb::https://cdn07.foxitsoftware.cn/pub/foxit/phantomPDF/desktop/linux/11.x/11.0/zh_cn/com.foxit.foxitpdfeditor_${pkgver}_amd64.deb"
"${_pkgname}.sh"
)
sha512sums_x86_64=('906c061baf440035669f0307d32b8607baa6d53df2b706582e9bf2eb5b7190bf8bbfbf2fe88566351ac80ef3503f0324a30d6da67a7c9fd3b80883635bb8535a'
                   'f877489dcb72be7e9762f067804b6b1216c19233203c866f4c0029d9b02da38e2294bb0fafef3511d909434e4151ce66cf49fb4d75a4cb3cb7732e9fa4076d39')
prepare(){
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"
    cd $srcdir/opt/apps/com.foxit.${_pkgname}/files
    sed -i "s|^Exec.*|Exec=${_pkgname} %F|" com.foxit.${_pkgname}.desktop
    sed -i "s|^Icon.*|Icon=FoxitPDFEditor|" com.foxit.${_pkgname}.desktop

    sed -i "s|^Exec.*|Exec=foxitpdfeditor-activator %F|" Activation.desktop
    sed -i "s|^Icon.*|Icon=FoxitPDFEditorActivate|" Activation.desktop
    mv Activation.desktop foxitpdfeditor-activator.desktop

    #system qt
    rm -rf lib plugins libexec qt.conf Update.desktop
    # sed -i "2c Prefix = /usr/lib/qt" qt.conf

}


package(){
    cd $srcdir
    install -Dm755 $srcdir/${_pkgname}.sh  ${pkgdir}/usr/bin/${_pkgname}
    mkdir -p ${pkgdir}/opt/${_pkgname}
    mkdir -p ${pkgdir}/usr/share/
    cd  $srcdir/opt/apps/com.foxit.${_pkgname}
    cp -rf files/* ${pkgdir}/opt/${_pkgname}

    cd ${pkgdir}/opt/${_pkgname}
    mv resource/*  ${pkgdir}/usr/share/
    install -Dm644 images/FoxitPDFEditorActivate.png -t ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
    install -Dm644 *.desktop -t ${pkgdir}/usr/share/applications

    patchelf --set-rpath '/usr/lib/office6' WpsOfficeToPdf

    rm -rf *.sh *.desktop postinst prerm qtweb* resources images
}
