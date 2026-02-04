# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: witt <1989161762 at qq dot com>

pkgname=dingtalk-bin
_pkgname=dingtalk
_pkgname2=com.alibabainc.dingtalk
# https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/amd64/linux_dingtalk_update_package_gray.json
pkgver=8.1.0.6011301
pkgrel=1
pkgdesc="钉钉"
arch=("x86_64" 'aarch64')
url="https://www.dingtalk.com/"
license=("custom")
options=('!strip')
depends=("glu" 'gtk2' 'libxcrypt-compat')
makedepends=("patchelf")
optdepends=('zenity: fix crashes when downloading files, not required on kde.'
    'libxss: fix tray icon functionality in gnome.'
    'qt5-wayland: needed in wayland'
)
provides=('com.alibabainc.dingtalk' 'dingtalk')
conflicts=('com.alibabainc.dingtalk')
replaces=('com.alibabainc.dingtalk')
# https://tms.dingtalk.com/markets/dingtalk/service-terms-zh md5 will change per download
source_x86_64=("${_pkgname}_${pkgver}-x86_64.deb::https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/${_pkgname2}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}-aarch64.deb::https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/${_pkgname2}_${pkgver}_arm64.deb")
source=("service-terms-zh_${pkgver}-${pkgrel}.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_dingtalk/suit_bu1_dingtalk202010200940_84493.html"
    "${_pkgname2}.desktop"
    "dingtalk.sh"
    "${_pkgname2}.svg"
)

# DebSource & pkgver can be get here: https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/linux_dingtalk_update.json
sha512sums=('2b87849b0db3717f00809b2583511cc5cc5e7a9e0b123b54b11d7f7c0ad00008da73165efe40808511e64000e48db650f064192a27d425c23b67a7d8aaceb008'
            'c8570ec4cd978e26ac622a83db053a0555324752f5000dc5b3cd680d782138e8ef856f09ec9b7850e04e1faa1e39de94dabeb16fbfbe0fd44af43247b30e8b2f'
            'b2493e7bddc2d701204899bcd82930f97779eec23485870c64665c525b9faca382a3c0e9e9c1bd18f8fa8157ea408943e542de56dc3410388e78f30732511f5c'
            '5f05f90704526fbd16371f6f9deaa171a3cac25a103b21daba72a3028ab7cdf9b566a3ac7842c6ce88d30cc29fe0c8b989c77aa36daab73793a827a1a0d6c775')
sha512sums_x86_64=('9d46988d7f26beb71d7d9c4f721068cf8c59a492da661ce1f7312e0871ded107091c5fefc0dc3dc7b5926bd1131e322b4cdec90f23d94b71380272d89df2f35d')
sha512sums_aarch64=('e9a3bf04edae24d9dc26c86a7dc6b1c6b0fda7420eb3425f80abe5fd6dec14fa0c57ca7b025743df3edd0626fb60d10eb6a39b0286ff67bf9635bf28289f76a5')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/opt/${_pkgname}/release"
    mkdir -p "${pkgdir}/usr/share/doc/"
    mv "opt/apps/${_pkgname2}/files/"*-Release.*/* "${pkgdir}/opt/${_pkgname}/release"
    mv "opt/apps/${_pkgname2}/files/version" "${pkgdir}/opt/${_pkgname}"
    mv "opt/apps/${_pkgname2}/files/doc/${_pkgname2}" "${pkgdir}/usr/share/doc/${_pkgname}"

    # binary wrapper
    install -Dm755 "${srcdir}/dingtalk.sh" "${pkgdir}/usr/bin/dingtalk"

    # desktop enrty
    install -Dm644 "${_pkgname2}.desktop" -t "${pkgdir}/usr/share/applications/"

    install -Dm644 "${srcdir}/${_pkgname2}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    # license
    install -Dm644 "service-terms-zh_${pkgver}-${pkgrel}.html" "${pkgdir}/usr/share/licenses/${_pkgname}/service-terms-zh.html"

    patchelf --clear-execstack "${pkgdir}/opt/dingtalk/release"/{dingtalk_dll,libconference_new}.so

    # fix chinese input in workbench
    rm -rf "${pkgdir}/opt/${_pkgname}/release/libgtk-x11-2.0.so."*

    rm -rf "${pkgdir}/opt/${_pkgname}/release"/{libm.so.6,Resources/{i18n/tool/*.exe,qss/mac,web_content/NativeWebContent_*.zip},libstdc*}

    # remove unused lib
    rm -rf "${pkgdir}/opt/${_pkgname}/release"/{libcurl.so.4,libz*,libGL*}
}
