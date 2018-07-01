# Maintainer: Sebastian Wieland <wieland.s[at]online[dot]de>

pkgname=nextcloud-client-appimage-daily
_pkgname=nextcloud
pkgver=latest
pkgrel=2
pkgdesc="Nextcloud desktop client (official daily AppImage build)"
arch=('x86_64' 'i686')
url="https://download.nextcloud.com/desktop/daily/Linux/"
license=('GPL2')
provides=('nextcloud-client')
conflicts=('nextcloud-client' 'nextcloud-client-git' 'owncloud-client')
makedepends=('p7zip')
noextract=("$_pkgname.AppImage")
options=('!strip')

source=(${_pkgname}.AppImage::https://download.nextcloud.com/desktop/daily/Linux/latest.AppImage)
# Skipping Checksum as it changes daily
sha256sums=(SKIP)

prepare() {
    cd "${srcdir}"

    # Extract relevant files from AppImage
    7z x -y ${_pkgname}.AppImage usr/share/icons > /dev/null
    7z x -y ${_pkgname}.AppImage ${_pkgname}.desktop > /dev/null
}

package() {
  cd "${srcdir}"

  # Copy Icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/icons"

  # Install to /opt/appimage/
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${_pkgname}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  
  # Create Link in /usr/bin/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
