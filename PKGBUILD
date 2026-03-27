# Maintainer: delta-whiplash <delta@delta-net.ovh>

pkgname=pake-lizhi
_appname=LiZhi
_pkgver=3.10.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="${_appname} wrapped as a desktop app using Pake"
arch=('x86_64')
url="https://github.com/tw93/Pake"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
options=('!strip' '!debug')

source=(
    "${_appname}-${_pkgver}.deb::https://github.com/tw93/Pake/releases/download/V${_pkgver}/${_appname}_${CARCH}.deb"
    "LICENSE-${_pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${_pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    # Extract deb package
    bsdtar -xf "${_appname}-${_pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"
}

package() {
    # Install binary - Pake uses 'pake-${_appname,,}' format
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname,,}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file - use com.pake.${_appname,,}.desktop
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname,,}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install icon
    if [[ -f "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname,,}.png" ]]; then
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname,,}.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    fi
    
    # Install license
    install -Dm644 "${srcdir}/LICENSE-${_pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
