# Maintainer: J0k3r <moebius282@gmail.com>

pkgname=reus
pkgver=1389636757
pkgrel=1
epoch=1
pkgdesc="A god game in which you take control of nature through the hands of mighty giants"
url="http://www.reusgame.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
depends=('gcc-libs' 'libvorbis' 'openal' 'libtheora' 'freetype2' 'sdl2')
makedepends=('unzip' 'imagemagick')
changelog="${pkgname}.changelog"
_purgelibs=('libtheora.so.0' 'libtheoradec.so.1' 'libvorbis.so.0' 'libopenal.so.1' 'libogg.so.0' 'libfreetype.so.6' 'libSDL2-2.0.so.0')
_binver=$pkgver
_archivename="${pkgname}_linux_${_binver}-bin"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.changelog")
sha256sums=('e9f2306bbbf8908b1dd4d09519959316a31df38002e80bfb74116cd338c50584'
            '91e5b44bed07a180f591687d199fb88507a80f91cbea6cb6b42d19bfce73323a'
            'SKIP')
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

  if [ "$CARCH" = "x86_64" ]; then

    rm -r "${pkgdir}/opt/${pkgname}/lib/"
    rm "${pkgdir}/opt/${pkgname}/${pkgname^}.bin.x86"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/lib64/${i}"
    done

  else

    rm -r "${pkgdir}/opt/${pkgname}/lib64/"
    rm "${pkgdir}/opt/${pkgname}/${pkgname^}.bin.x86_64"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/lib/${i}"
    done

  fi

# patching the included startup script so it supports being symlinked
  sed -i -e 's|`dirname "$0"`|$(dirname \"$(readlink -f \"$0\")\")|' "${pkgdir}/opt/${pkgname}/Reus"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/Reus" "${pkgdir}/usr/bin/${pkgname}"

# the spec only specifies png, svg and xpm..

  convert "${pkgdir}/opt/${pkgname}/Reus.bmp" "${pkgdir}/opt/${pkgname}/${pkgname}.png"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}