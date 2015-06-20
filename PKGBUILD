# Contributor: Gadget30000 <gadget3000 at msn dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=multiwinia
pkgver=1.3.1
pkgrel=3
pkgdesc='Challenge your opponent to a game of stick-man slaughter (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.introversion.co.uk/multiwinia/'
license=('custom')
depends=('glu' 'openal' 'sdl' 'libvorbis' 'libpng12')
if [ "${CARCH}" = "x86_64" ]; then
  _gamepkg="hib://${pkgname}_${pkgver}-1_amd64.tar.gz"
  _gamepkgsum='5eaba188f84ad985fe9b5d36e3bf85a3'
  _bin_postfix='_64'
else
  _gamepkg="hib://${pkgname}_${pkgver}-1_i386.tar.gz"
  _gamepkgsum='bbc7d907431f15065a0f38f6623c4217'
  _bin_postfix=
fi
source=("${pkgname}.desktop" "${_gamepkg}")
md5sums=('59653ec01acf2befc0211c4cd7ac13bc' "${_gamepkgsum}")
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
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/opt/${pkgname}/"
  install -m755 -t "${pkgdir}/opt/${pkgname}/" multiwinia.bin.x86${_bin_postfix}
  install -m644 -t "${pkgdir}/opt/${pkgname}/" \
      init.dat language.dat main.dat menusounds.dat sounds.dat sounds2.dat

  install -d "${pkgdir}/opt/${pkgname}/docs/"
  install -m644 -t "${pkgdir}/opt/${pkgname}/docs/" \
      docs/readme.txt docs/manual.pdf

  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/${pkgname}/multiwinia.bin.x86${_bin_postfix} \
      "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
