# Contributor: J0k3r <moebius282 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=superhexagon
pkgver=16
pkgrel=3
pkgdesc="A minimal action game by Terry Cavanagh, with music by Chipzel"
arch=('i686' 'x86_64')
url="http://superhexagon.com/"
license=('custom')
depends=('gcc-libs' 'freeglut' 'libvorbis' 'openal' 'glu' 'glew1.6')
install="${pkgname}.install"
_binver="1366677959"
_gamepkg="super-hexagon-linux-${pkgver}-bin-${_binver}"
source=("hib://${_gamepkg}"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.install"
        "${pkgname}rc.example")
noextract=("${_gamepkg}")
sha256sums=('2c6dfba53cb0dd58bcbff519862af8bf7af67475845bb43207e9d32032efa104'
            'fecc1b8c99b3758ac705ed6f8eedb8a28434d2cdd91deec457e192b3be280273'
            '6399b71d49dc5e313b6e882ae51b33df043b945ae102666c94a457cfaac15e4e'
            '1f183c17982dd12f8a1ccd310d27c74eaf83f550571e8e6ff77cc735f29b55b7'
            'ff966f4106571ae7e5906bb2a47944d03c3ec73e280f43c1693da8121df80a81')

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

prepare() {
  cd "${srcdir}"

  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -x -C "${pkgname}-${pkgver}" -f "${_gamepkg}"
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd data
  install -d "${pkgdir}/opt/${pkgname}"
  install -m644 -t "${pkgdir}/opt/${pkgname}" \
      Linux.README \
      "${srcdir}/${pkgname}rc.example"
  cp -r data "${pkgdir}/opt/${pkgname}"
  rm "${pkgdir}/opt/${pkgname}/data/license.txt"

  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 x86_64/${pkgname}.x86_64 \
        "${pkgdir}/opt/${pkgname}/${pkgname}"
  else
    install -m755 x86/${pkgname}.x86 \
        "${pkgdir}/opt/${pkgname}/${pkgname}"
  fi

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "SuperHexagon.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 data/license.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
