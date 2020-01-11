# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: mikers <mikeonthecomputer at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=vvvvvv
pkgver=2.2
_pkgver=10202016
pkgrel=3
pkgdesc='A retro-styled 2D platformer (game sold separately)'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
license=('custom')
depends=('sh' 'sdl2_mixer')
_gamepkg="${pkgname}-${_pkgver}-bin"
source=("hib://${_gamepkg}" "${pkgname}.desktop" "${pkgname}.sh")
md5sums=('2a67882173f36c685f532e3cce0607af'
         'f3f06f16bf7f3280279e2d3da425a5d2'
         '6d1c555a18bcd5cba8c55a62cf0964ac')
sha256sums=('8b02d2c55dbc3b94e12c5131cc896b81ae3001aa13c90bb25dffe2ed8b5d2e55'
            '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
            '883913125c4630d16fe0081d9a96bf65f2bc08ace7fa345613669d827a8ea7c1')
noextract=("${_gamepkg}")
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf or ~/.makepkg.conf to auto-download.
#
# For example, to auto-search through a directory containing Huble Bundle
# downloads, set something like this in your makepkg.conf:
# DLAGENTS=('hib::/usr/bin/bash -c /usr/bin/find\ /path/to/downloads\ -name\ $(echo\ %u\ |\ cut\ -c\ 7-)\ -exec\ ln\ -s\ \\{\\}\ %o\ \\\;\ -quit')
#
# The escaping is a bit obnoxious for this use, so you probably want to make a
# shell script for the command:
# DLAGENTS=('hib::/home/youruser/hib-search.sh %u %o')
#
# /home/youruser/hib-search.sh:
# #!/bin/bash
# find /path/to/downloads -name ${1#hib://} -exec ln -s \{\} $2 \; -quit
DLAGENTS+=('hib::/usr/bin/bash -c echo\ Could\ not\ find\ %u.\ Download\ manually\ to\ \\"$(pwd)\\"\ or\ set\ up\ hib://\ DLAGENT\ in\ /etc/makepkg.conf.;\ echo\ Read\ this\ PKGBUILD\ for\ more\ info.;\ exit\ 1')

prepare() {
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
