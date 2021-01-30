# Maintainer: Michael Riegert <michael at eowyn net>
# Based on PKGBUILD by: Alec Mev <alec@mev.earth>

pkgname=campuswire-nativefier
_pkgname=Campuswire
pkgver=2021.01.30.06.30
pkgrel=1
pkgdesc='A tool for college classes that makes class discussions, Q&A and announcements extremely simple'
arch=('any')
url='https://campuswire.com'
license=('custom')
depends=('electron')
source=(${_pkgname}.png::https://static.campuswire.com/favicon.ico)
md5sums=('SKIP')
makedepends=(
    'curl'
    'gendesk'
    'nodejs-nativefier'
)

pkgver() {
    date -u +%Y.%m.%d.%H.%M
}

prepare() {
    cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec electron /usr/share/${pkgname} "\$@"
EOF
    gendesk \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_pkgname}" \
        --icon=${_pkgname}.png \
        -n \
        -f
}

build() {
    cd "${srcdir}"
    nativefier \
      --name "${_pkgname}" \
      --icon "${_pkgname}.png" \
      --maximize \
      --single-instance \
      --tray \
      --counter \
      --verbose \
      ${url}
}

package() {
    mkdir -p "${pkgdir}/usr/share"
    local _x=`echo "${_pkgname}-linux-"*`
    cp -r "${srcdir}/${_x}/resources/app" "${pkgdir}/usr/share/${pkgname}"
    rm "${pkgdir}/usr/share/${pkgname}/icon.png"
    cp "${_pkgname}.png" "${pkgdir}/usr/share/${pkgname}/icon.png"
    install -Dm 755 -t "${pkgdir}/usr/bin/" "${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_x}/LICENSE"
    install -Dm 644 -t "${pkgdir}/usr/share/pixmaps/" "${_pkgname}.png"
}
