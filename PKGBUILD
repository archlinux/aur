# Maintainer: Lahfa Samy <'akechishiro-aur' at 'lahfa[dot]xyz'>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sebastian Wieland <wieland.s[at]online[dot]de>
_pkgname=nextcloud
pkgname=${_pkgname}-client-appimage-daily
pkgver=3.5.50.20220615
pkgrel=1
epoch=1
pkgdesc="Nextcloud desktop client (official daily AppImage build)"
arch=('x86_64' 'i686')
url="https://download.nextcloud.com/desktop/daily/Linux"
license=('GPL2')
provides=('nextcloud-client')
conflicts=('nextcloud-client' 'nextcloud-client-git' 'owncloud-client')
depends=('zlib')
optdepends=('hicolor-icon-theme: needed for hicolor theme hierarchy')
makedepends=('p7zip' 'curl')
noextract=("$_pkgname.AppImage")
options=('!strip')
source=(${_pkgname}-${pkgver}.AppImage::${url}/Nextcloud-${pkgver}-daily-x86_64.AppImage)
sha256sums=('1f20a099e2763af81b481997cc9e95ecb34485acb49f5b62f19e93d7ff03c946')

prepare() {
    cd "${srcdir}"

    # Extract relevant files from AppImage
    7z x -y ${_pkgname}-${pkgver}.AppImage usr/share/icons > /dev/null
    7z x -y ${_pkgname}-${pkgver}.AppImage com.${_pkgname}.desktopclient.${_pkgname}.desktop > /dev/null
}

package() {
  cd "${srcdir}"

  # Copy Icons
  install -dm644 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "usr/share/icons" "${pkgdir}/usr/share"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} \;

  # Install to /opt/appimage/
  install -Dm644 "com.${_pkgname}.desktopclient.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"

  # Create Link in /usr/bin/
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
