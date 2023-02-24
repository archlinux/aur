# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=23.2.3.4
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('freeimage' 'qrencode'  'freetype2' 'python' 'log4cpp')
makedepends=('patchelf')
source=('zwcad.sh')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/2023/SP2/zwcad2023_23.2.3.4_amd64.deb?auth_key=1677250795-0-0-6b84b2d9fef19aed29d558b343c20d50")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/2023/SP2/zwcad2023_23.2.3.4_arm64.deb?auth_key=1677250795-0-0-7af64a3a729cfdb1f9dad2e2c94da7f3")
sha512sums=('3f978fc46a39c8e65551a8e581f234526183b6b811b1e857fb17903549b10442b676713c342880d144a47fc5da76882152901533abd898a24588b7e9bbbc207c')
sha512sums_x86_64=('47c52811cf396e81a94ab2877cce0591c8b0a98e12df48d8bf02b634a123f7be68f32f0b03a05e3b89d9995cb6f0738f8ff1e0cce2af396571cd352d395b2c37')
sha512sums_aarch64=('2e511a7374f06d5d6d0519f90bacedb9cc15c05f6c6d129b680745eb418f7e6a99f6c7857ec5c12b42023327d5d3c71f2f7019afa7ba036ee1c3bf1fe949942a')
options=(!strip)
# no need to strip, it only decreases the installed size by 24.44 MiB.

prepare(){
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"

    cp zwcad.sh zwlmgr.sh
    sed -i '$d' zwlmgr.sh
    echo './ZwLmgr /language zh-CN /language zh-CN' >>zwlmgr.sh

    cd $srcdir/opt/apps/zwcad${_year}
    #system qt
    rm -rf lib/libQt* plugins  qt.conf

    #system python
    cd ZwPyRuntime
    local _pyver=$(python -V | cut -d' ' -f2)
    test -d python${_pyver%.*} || mkdir python${_pyver%.*}
    cp python3.8/ZwPyRuntime.so python${_pyver%.*}
    rm -rf python3.{4,5,6,7,8}
}
build(){

    cd $srcdir/opt/apps/zwcad${_year}

    # Fix ./ZWLMGRRUN.sh and ./ZWCADRUN.sh not found
    sed -i 's|ZWLMGRRUN.sh|zwlmgr\x0\x0\x0\x0\x0\x0|g' ZWCAD
    sed -i 's|ZWCADRUN.sh|zwcad\x0\x0\x0\x0\x0\x0|g' ZwLmgr

    # Fix desktop
    cd $srcdir/usr/share/applications/
    sed -i "s|^Exec=.*|Exec=zwcad %F|g;s|^Icon=.*|Icon=zwcad${_year}|g"   "zwcad${_year}.desktop"
    sed -i "s|^Exec=.*|Exec=zwlmgr|g;s|^Icon=.*|Icon=zwcad${_year}|g"   "zwlmgr${_year}.desktop"

}

package(){
    mkdir -p "$pkgdir"/opt
    cp -rf  "${srcdir}"/usr   "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    cp -rf  "${srcdir}"/opt/apps/zwcad${_year} "${pkgdir}"/opt/zwcad
    # chmod a-x "${pkgdir}"/opt/zwcad/Icons/ZWCAD.svg
    # mv "${pkgdir}"/opt/zwcad/Icons/ZWCAD.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps

    # create executable
    install -Dm755 ${srcdir}/zwcad.sh "$pkgdir"/usr/bin/zwcad
    install -Dm755 ${srcdir}/zwlmgr.sh "$pkgdir"/usr/bin/zwlmgr


    cd "$pkgdir"/opt/zwcad
    install -Dm644 sense4_usb.rules  ${pkgdir}/etc/udev/rules.d/sense4_usb.rules

    # patch rpath
    for lib in ${pkgdir}/opt/zwcad/{lib*.so,*.zrx}
    do
        echo patching $lib
        patchelf --set-rpath '$ORIGIN:/usr/lib/zwcad' $lib
    done;
    for lib in ${pkgdir}/opt/zwcad/zh-CN/lib*.so
    do
        echo patching $lib
        patchelf --set-rpath '$ORIGIN:/usr/lib/zwcad' $lib
    done;
    _pyver=$(python -V | cut -d' ' -f2)
    patchelf --set-rpath '$ORIGIN:/usr/lib/zwcad' ${pkgdir}/opt/zwcad/ZwPyRuntime/python${_pyver%.*}/ZwPyRuntime.so
    patchelf --set-rpath '$ORIGIN:/usr/lib/zwcad' ${pkgdir}/opt/zwcad/ZWCAD

    # move libs
    mkdir -p ${pkgdir}/usr/lib/zwcad
    mv "$pkgdir"/opt/zwcad/{lib/libSpaA*,libdwf*,libsw*,libfsdk*}  ${pkgdir}/usr/lib/zwcad



    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/{Icons,ZWCADRUN.sh,ZWLMGRRUN.sh}
    rm -rf ${pkgdir}/opt/zwcad/{libfree*,libqren*,libcrypto*,libgmp*,liblog4cpp*,libssl*,*.rules}
    rm -rf ${pkgdir}/opt/zwcad/lib/{libicu*,libpcre*}


}
