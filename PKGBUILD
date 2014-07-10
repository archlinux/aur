# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=superhexagon
pkgver=16
pkgrel=2
pkgdesc="A minimal action game by Terry Cavanagh, with music by Chipzel"
url="http://superhexagon.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
depends=('gcc-libs' 'freeglut' 'libvorbis' 'openal' 'glu' 'glew1.6')
makedepends=('unzip')
install="${pkgname}.install"
_purgelibs=('libglut.so.3' 'libogg.so.0' 'libopenal.so.1' 'libstdc++.so.6' 'libvorbis.so.0' 'libvorbisfile.so.3' 'libGLEW.so.1.6')
_binver="1366677959"
_archivename="super-hexagon-linux-${pkgver}-bin-${_binver}"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha256sums=('2c6dfba53cb0dd58bcbff519862af8bf7af67475845bb43207e9d32032efa104'
            '5a17e0ecb042af80754de5d9724521207cf1b49f0bceeeb9abe3e125a586bfef'
            'ba4062a89d569bc4af4d21c6660093e10d189715031630c4f7c6712452a03b40')
#PKGEXT=".pkg.tar"


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

    rm -r "${pkgdir}/opt/${pkgname}/x86/"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/x86_64/${i}"
    done

    # msg "Patching files ..."
    # mv -f "${srcdir}/x86_64/superhexagon.x86_64" "${pkgdir}/opt/${pkgname}/x86_64/"

  else

    rm -r "${pkgdir}/opt/${pkgname}/x86_64/"
    for i in "${_purgelibs[@]}"; do
      rm "${pkgdir}/opt/${pkgname}/x86/${i}"
    done

    # msg "Patching files ..."
    # mv -f "${srcdir}/x86/superhexagon.x86" "${pkgdir}/opt/${pkgname}/x86/"

  fi

# patching the included startup script so it supports being symlinked
# removing the steam bits out of the lib search path; i don't know why it contains a steam dir in the non-steam version..
  sed -i \
  -e 's|`dirname "$0"`|$(dirname \"$(readlink -f \"$0\")\")|' \
  "${pkgdir}/opt/${pkgname}/SuperHexagon"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/SuperHexagon" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/${pkgname}/SuperHexagon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
