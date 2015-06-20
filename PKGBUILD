# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: mikers <mikeonthecomputer at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=vvvvvv
pkgver=2.2
_pkgver=06182014
pkgrel=2
pkgdesc='A retro-styled 2D platformer (game sold separately)'
arch=('i686' 'x86_64')
url='http://thelettervsixtim.es/'
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
license=('custom')
depends=('sh' 'sdl2_mixer')
_gamepkg="${pkgname}-${_pkgver}-bin"
source=("hib://${_gamepkg}" "${pkgname}.desktop" "${pkgname}.sh")
md5sums=(
    '65312dd3b51c700927b1086ba045ece1'
    'f3f06f16bf7f3280279e2d3da425a5d2'
    '6d1c555a18bcd5cba8c55a62cf0964ac')
noextract=("${_gamepkg}")
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

build() {
  cd "${srcdir}"

  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -x -C "${pkgname}-${pkgver}" -f "${_gamepkg}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd data
  install -d "${pkgdir}/opt/${pkgname}"
  install -m644 -t "${pkgdir}/opt/${pkgname}" \
      data.zip \
      Linux.README
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 x86_64/${pkgname}.x86_64 \
        "${pkgdir}/opt/${pkgname}/${pkgname}"
  else
    install -m755 x86/${pkgname}.x86 \
        "${pkgdir}/opt/${pkgname}/${pkgname}"
  fi

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
