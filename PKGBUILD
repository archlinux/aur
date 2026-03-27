# Maintainer: delta-whiplash <delta@delta-net.ovh>

pkgname=pake-lizhi
_appname=LiZhi
_appname_lower=lizhi
_pkgver=3.10.0
pkgver=${_pkgver}
pkgrel=2
pkgdesc="${_appname} wrapped as a desktop app using Pake"
arch=('x86_64')
url="https://github.com/tw93/Pake"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
options=('!strip' '!debug')

source=(
    "${_appname}-${_pkgver}.deb::https://github.com/tw93/Pake/releases/download/V${_pkgver}/${_appname}_${CARCH}.deb"
    "LICENSE-${_pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${_pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    bsdtar -xf "${_appname}-${_pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"
}

package() {
    # Install binary
    install -Dm755 "${srcdir}/usr/bin/pake-${_appname_lower}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop file
    install -Dm644 "${srcdir}/usr/share/applications/com.pake.${_appname_lower}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # Install icon - desktop file expects ${_appname_lower}_512
    if [[ -f "${srcdir}/usr/lib/${_appname_lower}/png/${_appname_lower}_512.png" ]]; then
        install -Dm644 "${srcdir}/usr/lib/${_appname_lower}/png/${_appname_lower}_512.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname_lower}_512.png"
    elif [[ -f "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname_lower}.png" ]]; then
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_appname_lower}.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname_lower}_512.png"
    fi
    
    # Install license
    install -Dm644 "${srcdir}/LICENSE-${_pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
