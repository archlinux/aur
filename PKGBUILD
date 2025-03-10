# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: taotieren <admin@taotieren.com>
# PKGBUILD inspiration from fira-code

pkgbase=alibabasans-puhuiti3-fonts
pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}" "${pkgbase%-fonts}-fontconfig")
_fontname=AlibabaPuHuiTi-3
pkgver=3.0
pkgrel=4
pkgdesc="A typeface for creating alibaba sans puhuiti3 in text.阿里巴巴普惠体简体中文(3.0),7字重"
arch=('any')
url='https://www.alibabafonts.com/#/font'
license=('LicenseRef-custom')
makedepends=(fontconfig)
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/${_fontname}.zip"
    "license.txt"
)
sha256sums=('f25f730b6a7661bcd5b9764dc98f05d3ac25ee771977cf04b31ed5fba9f496a7'
            'd8a5691d7a5a7542a379ab9a568a16ca5cd5506e758fb46789bb79b42cb5635a')
function _package {
    depends=("${pkgbase%-fonts}-fontconfig")
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    for num in 35-Thin 45-Light 55-Regular 55-RegularL3 65-Medium 75-SemiBold 85-Bold 95-ExtraBold 105-Heavy 115-Black; do
        cd "${srcdir}/${_fontname}/${_fontname}-${num}"
        local fonts=("${_fontname}-${num}.${ext}")
        local installdir="${ext^^}"
        # Prepare destination directory
        install -dm755 "${pkgdir}/usr/share/fonts/${installdir}"
        # Install fonts
        local font
        for font in "${fonts[@]}"; do
            install -m644 "${font}" "${pkgdir}/usr/share/fonts/${installdir}"
            install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${ext}-${pkgbase}/LICENSE"
        done
    done
}
_pkgname=({eot,otf,ttf,woff,woff2}-"${pkgbase}")
for _pkgname in "${_pkgname[@]}"; do
    eval "function package_${_pkgname}() { _package ${_pkgname}; }"
done

package_alibabasans-puhuiti3-fontconfig() {
    pkgdesc="${pkgdesc} - Fontconfig configuration"
    depends=('fontconfig')
    install -Dm755 /dev/stdin "${pkgdir}/usr/share/fontconfig/conf.default/75-${pkgbase%-fonts}.conf" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
<fontconfig>
    <alias>
        <family>Alibaba Sans</family>
        <prefer><family>Alibaba PuHuiTi 3.0</family></prefer>
    </alias>
</fontconfig>
EOF
    install -dm755 "${pkgdir}/usr/share/fontconfig/conf.avail"
    ln -nsf "/usr/share/fontconfig/conf.default/75-${pkgbase%-fonts}.conf" "${pkgdir}/usr/share/fontconfig/conf.avail/75-${pkgbase%-fonts}.conf"
    install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgbase%-fonts}-fontconfig/LICENSE"
}
