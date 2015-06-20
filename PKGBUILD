# Contributor: Gadget30000 <gadget3000 at msn dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=darwinia
pkgver=1.43
pkgrel=2
pkgdesc='Save Darwinians from the Viral Infection that threatens their existance (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.introversion.co.uk/darwinia/'
license=('custom')
depends=('glu' 'sdl' 'libvorbis')
if [ "${CARCH}" = "x86_64" ]; then
  _gamepkg="hib://${pkgname}_${pkgver}_amd64.tar.gz"
  _gamepkgsum='3e6f7a3a8e1131334d2e0371dd9f7258'
  _bin_postfix='_64'
  _extracted_folder="${pkgname}"
else
  _gamepkg="hib://${pkgname}_${pkgver}_i386.tar.gz"
  _gamepkgsum='b29633364637e9ac0079068c7b57a861'
  _bin_postfix=
  _extracted_folder='Darwinia'
fi
source=('darwinia.desktop' "${_gamepkg}")
md5sums=('bed5bb0f56b58ddc842122cee08c8c76' "${_gamepkgsum}")
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
  cd "${srcdir}/${_extracted_folder}"

  install -d "${pkgdir}/opt/${pkgname}/"
  install -m755 -t "${pkgdir}/opt/${pkgname}/" darwinia.bin.x86${_bin_postfix}
  install -m644 -t "${pkgdir}/opt/${pkgname}/" language.dat main.dat sounds.dat

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/darwinia.bin.x86${_bin_postfix} \
      "${pkgdir}/usr/bin/darwinia"
  install -Dm644 darwinian.png "${pkgdir}/usr/share/pixmaps/darwinian.png"
  install -Dm644 license.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  install -Dm644 "${srcdir}/darwinia.desktop" \
      "${pkgdir}/usr/share/applications/darwinia.desktop"
}
