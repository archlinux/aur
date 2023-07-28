# Maintainer sukanka <su975853527 at gmail dot com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=24.0.2.3
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
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/2024/zwcad2024_24.0.2.3_amd64.deb?auth_key=1690549857-0-0-b6892670688f7bd5bd4dadd52629d815")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/2024/zwcad2024_24.0.2.3_arm64.deb?auth_key=1690549857-0-0-5896181fcadbec59eb315d18a65cc634")
sha512sums=('3f978fc46a39c8e65551a8e581f234526183b6b811b1e857fb17903549b10442b676713c342880d144a47fc5da76882152901533abd898a24588b7e9bbbc207c')
sha512sums_x86_64=('2cf0943a942e0ee6f6db63c8c74ac4ee97686b1978938e5e76cd9682f9d15b900f407759ea841ce62becb8527218ea0bca2390695bfbd38755b25572da40bc0b')
sha512sums_aarch64=('3c68ed5e31dad54abd223794243d0aa44b12c285029c65d0c657505eb4c748a366e5fe9165a7838bc654fad30cbafe904a822e45cfb471de739bde679bf8236e')
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
    sed -i "s|^Exec=.*|Exec=zwcloud2d|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwcloud2d.desktop"

}

package(){
    mkdir -p "$pkgdir"/opt
    cp -rf  "${srcdir}"/usr   "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    cp -rf  "${srcdir}"/opt/apps/zwcad${_year} "${pkgdir}"/opt/zwcad

    # create executable
    install -Dm755 ${srcdir}/zwcad.sh "$pkgdir"/usr/bin/zwcad
    install -Dm755 ${srcdir}/zwlmgr.sh "$pkgdir"/usr/bin/zwlmgr
    ln -s /opt/zwcad/ZwCloud2DLauncher "$pkgdir"/usr/bin/zwcloud2d


    cd "$pkgdir"/opt/zwcad
    install -Dm644 sense4_usb.rules  ${pkgdir}/etc/udev/rules.d/sense4_usb.rules

    # fix rpath
    find ${pkgdir}/opt/zwcad -executable -type f -print0 |
    xargs -0 -i  sh -c 'patchelf --set-rpath "\$ORIGIN:/usr/lib/zwcad" "{}" 2> /dev/null||true';

    # move libs
    mkdir -p ${pkgdir}/usr/lib/zwcad
    mv "$pkgdir"/opt/zwcad/{lib/libSpaA*,libdwf*,libsw*,libfsdk*}  ${pkgdir}/usr/lib/zwcad

    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/{Icons,ZWCADRUN.sh,ZWLMGRRUN.sh}
    rm -rf ${pkgdir}/opt/zwcad/{libfree*,libqren*,libcrypto*,libgmp*,liblog4cpp*,libssl*,*.rules}
    rm -rf ${pkgdir}/opt/zwcad/lib/{libicu*,libpcre*}
}
