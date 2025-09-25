# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: witt <1989161762 at qq dot com>

pkgname=dingtalk-bin
_pkgname=dingtalk
_pkgname2=com.alibabainc.dingtalk
# https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/amd64/linux_dingtalk_update_package_gray.json
pkgver=7.8.15.5092302
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
source=("service-terms-zh_${pkgver}.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_dingtalk/suit_bu1_dingtalk202010200940_84493.html"
    "${_pkgname2}.desktop"
    "dingtalk.sh"
    "${_pkgname2}.svg"
)

# DebSource & pkgver can be get here: https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Update/other/linux_dingtalk_update.json
sha512sums=('e8f6b011dce2b9ec5af567c310a39d08c94d821d3234edf81d01152e4008ce7c8343c9ee4150fcfc04babfbfaff8ec6b61b9b93bcd53e94e6e34211881c481e8'
            'c8570ec4cd978e26ac622a83db053a0555324752f5000dc5b3cd680d782138e8ef856f09ec9b7850e04e1faa1e39de94dabeb16fbfbe0fd44af43247b30e8b2f'
            'b2493e7bddc2d701204899bcd82930f97779eec23485870c64665c525b9faca382a3c0e9e9c1bd18f8fa8157ea408943e542de56dc3410388e78f30732511f5c'
            '5f05f90704526fbd16371f6f9deaa171a3cac25a103b21daba72a3028ab7cdf9b566a3ac7842c6ce88d30cc29fe0c8b989c77aa36daab73793a827a1a0d6c775')
sha512sums_x86_64=('e1e18d7151c1b601b5c1bf22b7f7e9e10d8d1ff211b57252be60b32e08f3ba5d8aee5ec1159d249d4c6efd90ead804d9874d79a31cdf008e2d284087191f97e4')
sha512sums_aarch64=('71e3ff20775b83798d59f177df18a3e5baf4f8d975fddc879ebec41d1e6ee3fd49fd27c860230ca2d923bcb32a5f838585acd9fb4bb5ccbe7759fd41bce5cc69')

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
    install -Dm644 "service-terms-zh_${pkgver}.html" "${pkgdir}/usr/share/licenses/${_pkgname}/service-terms-zh.html"

    patchelf --clear-execstack "${pkgdir}/opt/dingtalk/release"/{dingtalk_dll,libconference_new}.so

    # fix chinese input in workbench
    rm -rf "${pkgdir}/opt/${_pkgname}/release/libgtk-x11-2.0.so."*

    rm -rf "${pkgdir}/opt/${_pkgname}/release"/{libm.so.6,Resources/{i18n/tool/*.exe,qss/mac,web_content/NativeWebContent_*.zip},libstdc*}

    # remove unused lib
    rm -rf "${pkgdir}/opt/${_pkgname}/release"/{libcurl.so.4,libz*,libGL*}
}
