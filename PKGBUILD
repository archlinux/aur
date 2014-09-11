# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=fez
_datever="1409159048"
# _binver="1379017964"
pkgver="20140624"
pkgrel=1
epoch=1
pkgdesc="A game where you play as Gomez, a 2D creature living in what he believes is a 2D world"
url="http://fezgame.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
depends=('gcc-libs' 'bash' 'sdl2' 'openal')
makedepends=('unzip' 'imagemagick')
changelog="${pkgname}.changelog"
_purgelibs=('libopenal.so.1' 'libSDL2-2.0.so.0')
# _archivename="fez-${_datever}-${_binver}-bin"
_archivename="fez-${_datever}-bin"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.changelog")
noextract=("${_archivename}")
sha256sums=('1c29de47db568c1e0abc9997ccaa41ce490857db18dd9c3aaad79a5367330895'
            'f2dc00693860653ee62da751e1004c7240a9ac454ece8e72b354fdda259b047d'
            '9560decb9387cc9b85c43ca4c04fd79c9521c7f2eecc8acdf5ae9acb075ecc75')
PKGEXT=".pkg.tar"


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


package()
{
  mkdir -p "${pkgdir}/opt/${pkgname}/"

# unzip is stupid..
  unzip -qq "${srcdir}/${_archivename}" -d "${pkgdir}/opt/tmp/" 'data/*' || true

  mv "${pkgdir}/opt/tmp/data/"* "${pkgdir}/opt/${pkgname}/"
  rm -r "${pkgdir}/opt/tmp/"


  if [[ "$CARCH" == "x86_64" ]]; then

    rm -r "${pkgdir}/opt/${pkgname}/lib/"
    rm "${pkgdir}/opt/${pkgname}/${pkgname^^}.bin.x86"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/lib64/${i}"
    done

  else

    rm -r "${pkgdir}/opt/${pkgname}/lib64/"
    rm "${pkgdir}/opt/${pkgname}/${pkgname^^}.bin.x86_64"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/lib/${i}"
    done

  fi

# patching the included startup script so it supports being symlinked
# removing the steam bits out of the lib search path; i don't know why it contains a steam dir in the non-steam version..
  sed -i \
  -e 's|`dirname "$0"`|$(dirname \"$(readlink -f \"$0\")\")|' \
  "${pkgdir}/opt/${pkgname}/${pkgname^^}"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/${pkgname^^}" "${pkgdir}/usr/bin/${pkgname}"

# the spec only specifies png, svg and xpm..

  convert "${pkgdir}/opt/${pkgname}/${pkgname^^}.bmp" "${pkgdir}/opt/${pkgname}/${pkgname}.png"


  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
