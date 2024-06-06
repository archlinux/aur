# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dingtalk-bin
_pkgname=dingtalk
_pkgname2=com.alibabainc.dingtalk
pkgver=7.5.20.40605
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
            '963f23a36b9a25bb7e89a59b9f108886c08e9cdfc42e065a45040a96b848fc2b778a9e31d8c0013d2cb4b167e83eb9362accd5428f1b7ccd1062c2aea2ee22a9'
            '5f05f90704526fbd16371f6f9deaa171a3cac25a103b21daba72a3028ab7cdf9b566a3ac7842c6ce88d30cc29fe0c8b989c77aa36daab73793a827a1a0d6c775')
sha512sums_x86_64=('395638a29341bae5ffbef20700a7414e49272490ead27d7a3e428899a4f5592e1d1d7ea581f70175d408a9e9296ca5e7e9643ef660b333f774d930265b9d2ad7')
sha512sums_aarch64=('1aa3ac5f281de350eb92bfa9e8dec3f48e44fa1c80ccf86dab65ab82eb8aa0107e08e95366e1cac61777788a21df07c9d12869969dcf343d33c438f59f102f4c')

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
