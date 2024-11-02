# Maintainer sukanka <su975853527 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname='zwcad-bin'
_pkgname='zwcad'
pkgver=25.0.3.4
_year=20${pkgver:0:2}
pkgrel=0
epoch=1
pkgdesc="ZWSOFT研发的二维CAD软件，可满足看图、审图、打印工作需要"
# arch=('x86_64' 'aarch64')
arch=('x86_64')
license=('unknown')
url="https://www.zwcad.com"
provides=("zwcad")
depends=(
    bash
    curl
    expat
    freeimage
    freetype2
    gcc-libs
    qrencode
    glib2
    glibc
    glu
    giflib
    hicolor-icon-theme
    log4cpp
    libdrm
    libglvnd
    libjpeg-turbo
    libx11
    libxcb
    libxext
    libxxf86vm
    libxfixes
    libxshmfence
    mesa
    python
    krb5
    util-linux-libs
    zlib
)
makedepends=('patchelf')
source=('zwcad.sh')
# 由于上游使用动态验证下载，每次下载中间的信息会变动，于是改为从第三方软件下载。
# source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://download.zwsoft.cn/202411012038/ded6b656f41763609ece8ac461699cd3/zwcad/cad_linux/${_year}/zwcad${_year}_${pkgver}_amd64.deb")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://aur-repo.taotieren.com:3443/atzlinux/pool/non-free/z/zwcad${_year}/zwcad${_year}_${pkgver}_amd64.deb")
# source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://dl.zwsoft.cn/zwcad/cad_linux/${_year}/zwcad${_year}_${pkgver}_arm64.deb?auth_key=1690549857-0-0-5896181fcadbec59eb315d18a65cc634")
# source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://aur-repo.taotieren.com:3443/atzlinux/pool/non-free/z/zwcad${_year}/zwcad${_year}_${pkgver}_arm64.deb")
sha512sums=('3f978fc46a39c8e65551a8e581f234526183b6b811b1e857fb17903549b10442b676713c342880d144a47fc5da76882152901533abd898a24588b7e9bbbc207c')
sha512sums_x86_64=('6545800e3cfa648fcca2d16de698ed532ab6116a30bbfbc1057aafb6d200462731b01ed5b03fa5532a3059e1c4eb47fbb07af56b69b97f535f625b663fbb19da')
options=(!strip)
# no need to strip, it only decreases the installed size by 24.44 MiB.

prepare() {
    cd $srcdir
    tar -xJf data.tar.xz -C "${srcdir}"

    cp zwcad.sh zwlmgr.sh
    sed -i '$d' zwlmgr.sh
    echo './ZwLmgr /language zh-CN /language zh-CN' >>zwlmgr.sh

    cd $srcdir/opt/apps/zwcad${_year}
    #system qt
    rm -rf lib/libQt* plugins qt.conf

    #system python
    cd ZwPyRuntime
    local _pyver=$(python -V | cut -d' ' -f2)
    test -d python${_pyver%.*} || mkdir python${_pyver%.*}
    cp python3.8/ZwPyRuntime.so python${_pyver%.*}
    rm -rf python3.{4,5,6,7,8}
}
build() {

    cd $srcdir/opt/apps/zwcad${_year}

    # Fix ./ZWLMGRRUN.sh and ./ZWCADRUN.sh not found
    sed -i 's|ZWLMGRRUN.sh|zwlmgr\x0\x0\x0\x0\x0\x0|g' ZWCAD
    sed -i 's|ZWCADRUN.sh|zwcad\x0\x0\x0\x0\x0\x0|g' ZwLmgr

    # Fix desktop
    cd $srcdir/usr/share/applications/
    sed -i "s|^Exec=.*|Exec=zwcad %F|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwcad${_year}.desktop"
    sed -i "s|^Exec=.*|Exec=zwlmgr|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwlmgr${_year}.desktop"
    sed -i "s|^Exec=.*|Exec=zwcloud2d|g;s|^Icon=.*|Icon=zwcad${_year}|g" "zwcloud2d${_year}.desktop"

}

package() {
    mkdir -p "$pkgdir"/opt
    cp -rf "${srcdir}"/usr "$pkgdir"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/scalable/apps
    cp -rf "${srcdir}"/opt/apps/zwcad${_year} "${pkgdir}"/opt/zwcad

    # create executable
    install -Dm755 ${srcdir}/zwcad.sh "$pkgdir"/usr/bin/zwcad
    install -Dm755 ${srcdir}/zwlmgr.sh "$pkgdir"/usr/bin/zwlmgr
    ln -s /opt/zwcad/ZwCloud2DLauncher "$pkgdir"/usr/bin/zwcloud2d

    cd "$pkgdir"/opt/zwcad
    install -Dm644 sense4_usb.rules ${pkgdir}/etc/udev/rules.d/sense4_usb.rules

    # fix rpath
    find ${pkgdir}/opt/zwcad -executable -type f -print0 |
        xargs -0 -i sh -c 'patchelf --set-rpath "\$ORIGIN:/usr/lib/zwcad" "{}" 2> /dev/null||true'

    # move libs
    mkdir -p ${pkgdir}/usr/lib/zwcad
    mv "$pkgdir"/opt/zwcad/{lib/libSpaA*,libdwf*,libsw*,libfsdk*} ${pkgdir}/usr/lib/zwcad

    # remove unused files
    rm -rf "$pkgdir"/opt/zwcad/{Icons,ZWCADRUN.sh,ZWLMGRRUN.sh}
    rm -rf ${pkgdir}/opt/zwcad/{libfree*,libqren*,libcrypto*,libgmp*,liblog4cpp*,libssl*,*.rules}
    rm -rf ${pkgdir}/opt/zwcad/lib/{libicu*,libpcre*}
}
