# Maintainer: spampinatog <spampinatog at usbvap dot com>
# Contributor: Gadget30000 <gadget3000 at msn dot com>
# Contributor: Eric Anderson <ejona86@gmail.com>

pkgname=defcon-hib
_pkgname=defcon
pkgver=1.6
pkgrel=1
pkgdesc="The World's first Genocide 'em up (requires defcon from Humble Bundle)"
arch=('i686' 'x86_64')
url='http://www.introversion.co.uk/defcon/'
license=('custom')
depends=('glu' 'mesa' 'sdl' 'alsa-plugins' 'libpulse'
         'desktop-file-utils' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'xdg-utils')
conflicts=('defcon')
if [ "${CARCH}" = "x86_64" ]; then
  _gamepkg="hib://${_pkgname}_${pkgver}-1_amd64.tar.gz"
  _gamepkgsum='aacecb7e05cc9a2cf31fce8f87fb5cb6'
  _bin_postfix='_64'
else
  _gamepkg="hib://${_pkgname}_${pkgver}-1_i386.tar.gz"
  _gamepkgsum='231461515874c1d394e3bec0324ab32d'
  _bin_postfix=
fi
source=("${_pkgname}-16.png"
        "${_pkgname}-32.png"
        "${_pkgname}-48.png"
        "${_pkgname}-64.png"
        "${_pkgname}-128.png"
        "${_pkgname}.desktop"
        "${_gamepkg}")
md5sums=('5fe8db2ddd9d8b729bbdc45ef8ed952e'
         '9f644374d718126ddf5a1b8b6b4bf25e'
         'ba986cfe6c1cdfb2a415c0c551c840e2'
         '15e3ad4bea89ee96d62235ca371fb403'
         'a75d3a0b29668e3ebd2afcaec5d2b199'
         'e470f70aa1c72f6e37b77e27d769da3f'
         "${_gamepkgsum}")
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
  install -m 755 -D "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  for _size in 16 32 48 64 128
  do
    install -m 644 -D "${_pkgname}-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
  done

  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/opt/${_pkgname}/"
  install -m755 -t "${pkgdir}/opt/${_pkgname}/" defcon.bin.x86${_bin_postfix}
  install -m644 -t "${pkgdir}/opt/${_pkgname}/" \
      main.dat sounds.dat

  install -d "${pkgdir}/opt/${_pkgname}/docs/"
  install -m644 -t "${pkgdir}/opt/${_pkgname}/docs/" \
      linux.txt

  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/${_pkgname}/defcon.bin.x86${_bin_postfix} \
      "${pkgdir}/usr/bin/${_pkgname}"

  install -D -m 644 "license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/license.txt"
}
