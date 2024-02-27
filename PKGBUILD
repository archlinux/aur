# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dingtalk-bin
_pkgname=dingtalk
_pkgname2=com.alibabainc.dingtalk
pkgver=7.5.0.40221
pkgrel=1
pkgdesc="钉钉"
arch=("x86_64" 'aarch64')
url="https://www.dingtalk.com/"
license=("custom")
options=('!strip')
depends=("glu" 'gtk2' 'libxcrypt-compat')
#makedepends=("icoutils")
optdepends=('zenity: fix crashes when downloading files, not required on kde.'
'libxss: fix tray icon functionality in gnome.'
'qt5-wayland: needed in wayland'
)
provides=('com.alibabainc.dingtalk' 'dingtalk')
conflicts=('com.alibabainc.dingtalk')
replaces=('com.alibabainc.dingtalk')
# https://tms.dingtalk.com/markets/dingtalk/service-terms-zh md5 will change per download
source_x86_64=("${_pkgname}_${pkgver}-x86_64.deb::https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/${_pkgname2}_${pkgver}_amd64.deb")
source_aarch64=(${_pkgname}_${pkgver}-aarch64.deb::https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/${_pkgname2}_${pkgver}_arm64.deb)
source=("service-terms-zh"
        "${_pkgname2}.desktop"
        "dingtalk.sh"
        "${_pkgname2}.svg"
)


# DebSource & pkgver can be get here: https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/linux_dingtalk_update.json

sha512sums=('b83d493ed68be0f5a6b851fd93d819bb3a6e62feeb71a5bef10bad24b5ea8f3cf09deea4f31ed727449888a6eae1be99fa9cf263bc921cb8bb2958e2f37a7d64'
            'c8570ec4cd978e26ac622a83db053a0555324752f5000dc5b3cd680d782138e8ef856f09ec9b7850e04e1faa1e39de94dabeb16fbfbe0fd44af43247b30e8b2f'
            '8061f42e0190fcdd5d38183b25f97869041d58353ce8ca7351ba453d0eb55270f5625875d2dfc1cf9f85df3d41eb6e23536159c4480426141f0e8d47c124084f'
            '5f05f90704526fbd16371f6f9deaa171a3cac25a103b21daba72a3028ab7cdf9b566a3ac7842c6ce88d30cc29fe0c8b989c77aa36daab73793a827a1a0d6c775')
sha512sums_x86_64=('fe8c9a06b92643561b7dc1d4a2cdb88fb0bd84db2afb696a885bfa5ba48062cfc8c15de5151d4537a27123f886e8442d3a63a579dd87260e7747a20aedef1bff')
sha512sums_aarch64=('8a17ef294b2c16fbd24fd1a300cdaa482c01e74fd4b36b8379990e6991b09ced4c1082043b10020d8667e7b3afb1056bf555348614d6ea012e41919863d296b3')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    cd ${srcdir}

    mkdir -p ${pkgdir}/opt/${_pkgname}/release
    mkdir -p ${pkgdir}/usr/share/doc/
    mv opt/apps/${_pkgname2}/files/*-Release.*/* ${pkgdir}/opt/${_pkgname}/release
    mv opt/apps/${_pkgname2}/files/version ${pkgdir}/opt/${_pkgname}
    mv opt/apps/${_pkgname2}/files/doc/${_pkgname2} ${pkgdir}/usr/share/doc/${_pkgname}

    # binary wrapper
    install -Dm755 ${srcdir}/dingtalk.sh ${pkgdir}/usr/bin/dingtalk

    # desktop enrty
    install -Dm644 ${_pkgname2}.desktop -t ${pkgdir}/usr/share/applications/

    install -Dm644 ${srcdir}/${_pkgname2}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg

    # license
    install -Dm644 service-terms-zh ${pkgdir}/usr/share/licenses/${_pkgname}/service-terms-zh.html

    # fix chinese input in workbench
    rm -rf ${pkgdir}/opt/${_pkgname}/release/libgtk-x11-2.0.so.*

    rm -rf ${pkgdir}/opt/${_pkgname}/release/{libm.so.6,Resources/{i18n/tool/*.exe,qss/mac,web_content/NativeWebContent_*.zip},libstdc*}

    # remove unused lib
    rm -rf ${pkgdir}/opt/${_pkgname}/release/{libcurl.so.4,libz*}
}
