# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="glyphr-studio"
pkgname="${_pkgname}-nativefier"
pkgver=1.13.18
pkgrel=1
pkgdesc="Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="http://glyphrstudio.com/"
_githuburl="https://github.com/glyphr-studio/Glyphr-Studio-1"
license=("GPL3")
_electron=22
depends=("electron${_electron}")
makedepends=(gendesk yarn)
source=("${_pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b478367249e1065dc8d3c7542c805a48eec51b610be55d2302d61108f8c8a421')
prepare() {
    cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron${_electron} /usr/share/${pkgname} "\$@"
EOF
    gendesk \
    --pkgname "${_pkgname}" \
    --exec "/opt/${_pkgname}/${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "${_pkgname}" \
    --categories "Utility;" \
    -n \
    -f
}
build() {
    yarn add nativefier
    cp "${srcdir}/Glyphr-Studio-1-${pkgver}/dist/Glyphr_Studio_-_${pkgver}.html" "${srcdir}/${_pkgname}-${pkgver}.html"
    cp "${srcdir}/Glyphr-Studio-1-${pkgver}/glyphr_studio_logo.png" "${srcdir}/${_pkgname}.png"
    yarn nativefier "file:///opt/${_pkgname}/${_pkgname}-${pkgver}.html" \
    --name "${_pkgname}" \
    --icon "${_pkgname}.png" \
    --maximize \
    --user-agent safari \
    --single-instance \
    -e "22.3.3" \
    --verbose
}

package() {
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.html" "${pkgdir}/opt/${_pkgname}/${_pkgname}-${pkgver}.html"
    local _x=`echo "${_pkgname}-linux-"*`
    cp -r "${_x}/"* "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_x}/LICENSE" "${pkgdir}/usr/share/license/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}