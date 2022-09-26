# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=23.1.3.4
_year=20${pkgver:0:2}
pkgrel=1
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=('freeimage' 'qrencode'  'freetype2' 'python' 'openssl' 'log4cpp' 'gmp')
makedepends=('patchelf')
source=('zwcad.sh')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/${_year}/SP1/zwcad${_year}_${pkgver}_amd64.deb?auth_key=1664192656-0-0-eb3fc495266d480071161e6b7ac270f4")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/${_year}/SP1/zwcad${_year}_${pkgver}_arm64.deb?auth_key=1664192656-0-0-b2587d6066ca3b7ac1940cf4f135a7aa")
sha512sums=('3f978fc46a39c8e65551a8e581f234526183b6b811b1e857fb17903549b10442b676713c342880d144a47fc5da76882152901533abd898a24588b7e9bbbc207c')
sha512sums_x86_64=('7a3e85de6f61023ce91664e8ce795dd69e640f2a9a636c15e161c34c1bdf8dc4a0c660c544ab951087d9a609e1dbcd70456bd70002eef4820a3aae6ad6eb2374')
sha512sums_aarch64=('355ce8181fef73ca60bcd86941f2c32d3bcd3397e42a89dbd0df5d96621830fdeffc6e761b6dadb9c2338df7c60c25354f113c6253ff679817b712cde5aeb35c')
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
    rm -rf lib/{libQt*,libpng*} plugins libpng* qt.conf

    #system python
    cd ZwPyRuntime
    _pyver=$(python -V | cut -d' ' -f2)
    test -d python${_pyver%.*} || mkdir python${_pyver%.*}
    cp python3.7/ZwPyRuntime.so python${_pyver%.*}
    rm -rf python3.{4,5,6,7}

    cd $srcdir/opt/apps/zwcad${_year}
    rm -rf libZwPythonLoad{4,5,6}.so
    _midver=$(echo ${_pyver} |cut  -d'.' -f2)
    mv libZwPythonLoad7.so libZwPythonLoad${_midver}.so
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
    for lib in ${pkgdir}/opt/zwcad/lib*.so
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

    # Cheat ZwPyRuntime.so to use libpython3.10.so as libpython3.7m.so.1.0
    ln -s /usr/lib/libpython${_pyver%.*}.so ${pkgdir}/usr/lib/zwcad/libpython3.7m.so.1.0



    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/{Icons,ZWCADRUN.sh,ZWLMGRRUN.sh}
    rm -rf ${pkgdir}/opt/zwcad/{libfree*,libqren*,libcrypto*,libgmp*,liblog4cpp*,libssl*,*.rules}
    rm -rf ${pkgdir}/opt/zwcad/lib/{libicu*,libpcre*}


}
