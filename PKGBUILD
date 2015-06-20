# Maintainer: Eric Anderson <ejona86 at gmail dot com>
# Contributor: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=uplink-hib
_pkgname=uplink
pkgver=1.6_1
_pkgver=1.6-1
pkgrel=7
pkgdesc='A futuristic computer crime game (requires uplink from Humble Bundle)'
arch=('i686' 'x86_64')
url='http://www.introversion.co.uk/uplink'
license=('custom')
depends=('mesa' 'libjpeg6' 'sdl_mixer' 'libtiff3' 'freetype2')
conflicts=('uplink')
if [ "$CARCH" = "x86_64" ]; then
  _gamepkg="${_pkgname}_${_pkgver}_amd64.tar.gz"
  _gamepkgsum='8ee01e7d0d688339fbd84e2005d4625b'
  _archi='x64'
  _aarchi='x86_64'
  _libi='lib64'
else
  _gamepkg="${_pkgname}_${_pkgver}_i386.tar.gz"
  _gamepkgsum='db4f1b9506cff9e348dd52709f6a8ad7'
  _archi='x86'
  _aarchi='x86'
  _libi='lib'
fi
source=("${_pkgname}.desktop" "hib://${_gamepkg}")
md5sums=('e4c6a0050cb3a0894fb5c70a46c51414' "${_gamepkgsum}")
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
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download the file manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf"; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar.gz'

package() {
  cd "${srcdir}/${_pkgname}-${_archi}"

  install -d "${pkgdir}/opt"
  cp -r . "${pkgdir}/opt/${_pkgname}"

  # Use system-provided libraries where possible. Use provided mikmod since the
  # system version is too new. Use provided SDL_mixer since it crashes with
  # newer versions.
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libjpeg.so.62"
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libjpeg.so.62.0.0"
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libSDL-1.2.so.0"
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libSDL-1.2.so.0.11.3"
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libtiff.so.3"
  rm "${pkgdir}/opt/${_pkgname}/${_libi}/libtiff.so.3.8.2"

  # Fix permissions
  chmod -R 644 "${pkgdir}/opt/${_pkgname}"
  chmod +x "${pkgdir}/opt/${_pkgname}/${_libi}"
  chmod +x "${pkgdir}/opt/${_pkgname}"
  chmod +x "${pkgdir}/opt/${_pkgname}/uplink.bin.${_aarchi}"

  # Install Desktop File
  install -D -m644 "${srcdir}/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install License
  install -D -m644 "${pkgdir}/opt/${_pkgname}/license.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  # Link Executable
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/uplink.bin.${_aarchi}" "${pkgdir}/usr/bin/${_pkgname}"
}
