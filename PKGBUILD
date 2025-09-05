# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=25.1.1
pkgrel=1
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"
license=('https://polypane.app/legal/')
sha256sums=('259407fea1af754b3588f2c637eaf3d49673e174f8eb32d0f68760c7af03650c')
makedepends=('p7zip' 'curl' 'jq')
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
    sed -i "s/ (${pkgver})//" "${pkgname}.desktop" # prevent multiple .desktop entries
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}-${pkgver}.AppImage"

    # Create Link in /usr/bin/
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/appimages/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
