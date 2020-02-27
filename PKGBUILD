# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=2.1.2
pkgrel=1
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"

sha256sums=(8a3d0aba11d31408b0b2676ea1764fd0a8382f812e207f7b829f09776eaeb457)
makedepends=('p7zip' 'curl')
noextract=("$_pkgname-${pkgver}.AppImage")
options=('!strip')
source=(${_pkgname}-${pkgver}.AppImage::https://github.com/firstversionist/polypane/releases/download/v${pkgver}/polypane-${pkgver}.AppImage)

prepare() {
    cd "${srcdir}"

    # Extract AppImage Files
    7z x -y ${_pkgname}-${pkgver}.AppImage usr/share/icons > /dev/null
    7z x -y ${_pkgname}-${pkgver}.AppImage ${pkgname}.desktop > /dev/null
}

package() {
    cd "${srcdir}"

    # Copy Icons
    install -dm644 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;

    # Install to /opt/appimage/
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}-${pkgver}.AppImage"

    # Create Link in /usr/bin/
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/appimages/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
