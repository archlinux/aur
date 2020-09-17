# Maintainer: Braden Mars <bradenmars@bradenmars.me>

pkgname=polypane
_pkgname=Polypane
pkgver=latest
pkgrel=5
pkgdesc="Browser for building responsive websites and apps."
arch=('x86_64' 'i686')
url="https://polypane.app"
license=('https://polypane.app/legal/')
# Will always fetch latest, so checksum will change.
sha256sums=(SKIP)
makedepends=('p7zip' 'curl' 'jq')
noextract=("$_pkgname-${version}.AppImage")
options=('!strip')
version=$(curl https://api.github.com/repos/firstversionist/polypane/releases/latest | jq -r '.tag_name' | cut -c 2-)

source=(${_pkgname}-${version}.AppImage::https://github.com/firstversionist/polypane/releases/download/v${version}/polypane-${version}.AppImage)

prepare() {
    cd "${srcdir}"

    # Extract AppImage Files
    7z x -y ${_pkgname}-${version}.AppImage usr/share/icons > /dev/null
    7z x -y ${_pkgname}-${version}.AppImage ${pkgname}.desktop > /dev/null
}

package() {
    cd "${srcdir}"

    # Copy Icons
    install -dm644 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"
    find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;

    # Install to /opt/appimage/
    sed -i "s/ (${version})//" "${pkgname}.desktop" # prevent multiple .desktop entries
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "${_pkgname}-${version}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}-${version}.AppImage"

    # Create Link in /usr/bin/
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/appimages/${_pkgname}-${version}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
