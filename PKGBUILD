# Contributor: J0k3r <moebius282 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=superhexagon
pkgver=20160217
_pkgver=02172016
pkgrel=1
pkgdesc="A minimal action game by Terry Cavanagh, with music by Chipzel"
arch=('i686' 'x86_64')
url="https://www.superhexagon.com/"
license=('custom')
depends=('libvorbis' 'openal' 'sdl2' 'glew1.6')
_gamepkg="${pkgname}-${_pkgver}-bin"
source=("hib://${_gamepkg}"
        "${pkgname}.sh"
        "${pkgname}.desktop")
noextract=("${_gamepkg}")
sha256sums=('a27df72e78e8e7b791d213ab3da5b18f38b26c2d3a5dca58c47172bef6278527'
            '03e3f570cb09c92980e24510846db477e5d61880d6457e4bb627df51058ea0f8'
            '6399b71d49dc5e313b6e882ae51b33df043b945ae102666c94a457cfaac15e4e')

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
      SuperHexagon.png
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
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/SuperHexagon.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 data/license.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
