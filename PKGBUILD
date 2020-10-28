# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sebastian Wieland <wieland.s[at]online[dot]de>

_pkgname=nextcloud
pkgname=${_pkgname}-client-appimage-daily
pkgver=3.1.0.20201028
pkgrel=4
pkgdesc="Nextcloud desktop client (official daily AppImage build)"
arch=('x86_64' 'i686')
url="https://download.nextcloud.com/desktop/daily/Linux/"
license=('GPL2')
provides=('nextcloud-client')
conflicts=('nextcloud-client' 'nextcloud-client-git' 'owncloud-client')
makedepends=('p7zip' 'curl')
noextract=("$_pkgname.AppImage")
options=('!strip')

version=$(curl -s 'https://download.nextcloud.com/desktop/daily/Linux/' | sed 's/</\'$'\n''</g' | grep AppImage | sed 's/.*>//g' | sort -Vr | head -n 1)
source=(${_pkgname}.AppImage::https://download.nextcloud.com/desktop/daily/Linux/${version})
# Skipping Checksum as it changes daily
sha256sums=('d842b0a0a57f5a702c88984a09a2032e73384ef5e485dc0f249bb57109e8e951')

prepare() {
    cd "${srcdir}"
    echo "Latest version: ${version}"

    # Extract relevant files from AppImage
    7z x -y ${_pkgname}.AppImage usr/share/icons > /dev/null
    7z x -y ${_pkgname}.AppImage com.${_pkgname}.desktopclient.${_pkgname}.desktop > /dev/null
}

package() {
  cd "${srcdir}"

  # Copy Icons
  install -dm644 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;

  # Install to /opt/appimage/
  install -Dm644 "com.${_pkgname}.desktopclient.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${_pkgname}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"

  # Create Link in /usr/bin/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
