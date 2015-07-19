# Maintainer: Ben Morgan <neembi@gmail.com>
# Contributor: Dennis Hamester <dennis [dot] hamester [at] gmail [dot] com>
# Contributor: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=thefall
pkgver=1.5
_pkgver=1_5
pkgrel=2
pkgdesc="Adventure, puzzle, and side-scroller action game (requires full copy of the game)"
license=('custom:commercial')
arch=('i686' 'x86_64')
url="http://www.overthemoongames.com/"
depends=('gcc-libs' 'glu')
_gamepkg="TheFall_Linux_${_pkgver}.zip"

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("${_gamepkg}"::"hib://${_gamepkg}"
        ${pkgname}.sh
        ${pkgname}.desktop)
md5sums=('dca669c3278a3f899d3b2daede234b06'
         '14ee5efab3c35dde029811b2807afd9b'
         '69eb03b143b605184e1505d60e66818a')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/TheFall_Data" "${pkgdir}/opt/${pkgname}/"
  cp "${srcdir}/TheFall.x86" "${pkgdir}/opt/${pkgname}/"

  # fix file permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/${pkgname}/TheFall.x86"

  install -Dm644 "${srcdir}/TheFall_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
