# Contributor: J0k3r <moebius282 at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=fez
_datever="11282016"
pkgver="20161128"
pkgrel=1
epoch=1
pkgdesc="A game where you play as Gomez, a 2D creature living in what he believes is a 2D world"
url="http://fezgame.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
depends=('gcc-libs' 'sdl2' 'openal' 'libvorbis' 'libogg')
makedepends=('imagemagick')
changelog="${pkgname}.changelog"
_keeplibs=('libmojoshader.so' 'libMonoPosixHelper.so')
_archivename="fez-${_datever}-bin"
source=("hib://${_archivename}"
        "${pkgname}.desktop"
        "${pkgname}.sh")
noextract=("${_archivename}")
sha256sums=('cc929f84ab5ee00a8dd1400a9c4809710817fbf03da8f72ea364854b15936288'
            'c8f8a983d2fff58e77287a5e132bb06e84f17d0ac67c44b5fb9fe1e13ef006c0'
            '3d26540f0f48462f4669b094f1963caffa817361ee357bcb5f5aeb8f5a0ce518')
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

prepare()
{
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -x -C "${pkgname}-${pkgver}" -f "${_archivename}"
}

build()
{
  cd "${pkgname}-${pkgver}"

  # The Icon Theme Specification only supports png, svg, and xpm
  convert "data/${pkgname^^}.bmp" "${pkgname}.png"
}

package()
{
  cd "${pkgname}-${pkgver}"

  install -d "${pkgdir}/opt"
  cp -a "data/" "${pkgdir}/opt/${pkgname}/"
  rm -r "${pkgdir}/opt/${pkgname}/"{lib,lib64,FEZ.bin.*,FEZ}

  if [[ "$CARCH" == "x86_64" ]]; then
    install -m755 "data/${pkgname^^}.bin.x86_64" \
        "${pkgdir}/opt/${pkgname}/"
    _libdir=lib64
  else
    install -m755 "data/${pkgname^^}.bin.x86" \
        "${pkgdir}/opt/${pkgname}/"
    _libdir=lib
  fi

  install -d "${pkgdir}/opt/${pkgname}/${_libdir}"
  for i in "${_keeplibs[@]}"; do
    install -m755 "data/${_libdir}/${i}" \
        "${pkgdir}/opt/${pkgname}/${_libdir}/${i}"
  done

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
