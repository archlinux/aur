# Maintainer: Tharre <tharre3@gmail.com>
# Contributor: Dennis Hamester <dennis [dot] hamester [at] gmail [dot] com>
# Contributor: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=ftl
pkgver=1.5.13
pkgrel=1
pkgdesc="FTL: Faster Than Light, a spaceship simulation real-time roguelike-like (requires full copy of the game)"
license=('custom:commercial')
arch=('i686' 'x86_64')
url="http://www.ftlgame.com/"
depends=('gcc-libs' 'glu')
makedepends=('imagemagick')
_gamepkg="FTL.${pkgver}.tar.gz"

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
md5sums=('791e0bc8de73fcdcd5f461a4548ea2d8'
         'c415361a58df0857d9a42653fdaadd5a'
         'f7a67ce1e0311d98f41e6d80d872cb97')
PKGEXT='.pkg.tar'

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/FTL/"* "${pkgdir}/opt/${pkgname}/"

  # fix file permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/opt/${pkgname}/FTL"
  chmod 755 "${pkgdir}/opt/${pkgname}/data/FTL"

  if [ "${CARCH}" = "i686" ]; then
    rm -r "${pkgdir}/opt/${pkgname}/data/amd64"
    find "${pkgdir}/opt/${pkgname}/data/x86" -type f -exec chmod 755 {} +
  else
    rm -r "${pkgdir}/opt/${pkgname}/data/x86"
    find "${pkgdir}/opt/${pkgname}/data/amd64" -type f -exec chmod 755 {} +
  fi

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/pixmaps/${pkgname}"
  convert "${pkgdir}/opt/${pkgname}/data/exe_icon.bmp" "${pkgdir}/usr/share/pixmaps/${pkgname}/${pkgname}.png"
  install -dm755 "${pkgdir}/usr/share/licenses"
  ln -s "/opt/${pkgname}/data/licenses/" "${pkgdir}/usr/share/licenses/${pkgname}"
}

