# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=3.0.2
pkgrel=2
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"

sha256sums=('12a15a7820964bd23c3ceb94b030dabfd102a9fce264d012ec3b5d02e0343a7b')
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
