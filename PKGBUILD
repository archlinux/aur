# Contributor: gadget3000 <gadget3000 at msn dot com>
# Contributor: mikers <mikeonthecomputer at gmail dot com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=vvvvvv
_pkgname=VVVVVV
pkgver=2.3.4
_pkgver=10202016
pkgrel=1
pkgdesc='A retro-styled 2D platformer (game sold separately)'
arch=('i686' 'x86_64')
url='https://thelettervsixtim.es/'
groups=('humblebundle3' 'humblebundle4' 'humblebundles')
license=('custom')
depends=('sh' 'sdl2_mixer')
makedepends=('cmake')
_gamepkg="${pkgname}-${_pkgver}-bin"
source=("hib://${_gamepkg}"
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/TerryCavanagh/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "rm-srcdir-in-bin.patch")
md5sums=('2a67882173f36c685f532e3cce0607af'
         'e6ee8b4f7f143104a495d91bad057807'
         'f3f06f16bf7f3280279e2d3da425a5d2'
         '9e0cf26cc72b5d409321895c36a6ade6')
sha256sums=('8b02d2c55dbc3b94e12c5131cc896b81ae3001aa13c90bb25dffe2ed8b5d2e55'
            '514b85ee21a3a8d9bfb9af00bc0cd56766d69f84c817799781da93506f30dd9c'
            '8c704e92e6abc8172d7d9fe726f1a0bba4b8630682745d6daf1f34ce12e0e3e4'
            '1707013fe1bc924d1f9a1443d504e7cbef6eb5595fe2a5c6586945fb908f778a')
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

  mkdir -p "${_gamepkg}-extract"
  bsdtar -x -C "${_gamepkg}-extract" -f "${_gamepkg}"

  patch -p1 -i "${srcdir}/rm-srcdir-in-bin.patch" -d "${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/desktop_version"

  mkdir -p build
  cd build
  cmake -DOFFICIAL_BUILD=ON ..
  make

  cd "${srcdir}/${_gamepkg}-extract"

  echo "No known license for data.zip. Not for redistribution" >> LICENSE
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -D -m755 "desktop_version/build/${_pkgname}" \
      "${pkgdir}/usr/lib/${pkgname}/${_pkgname}"
  install -D -m644 "LICENSE.md" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-bin"

  cd "${srcdir}/${_gamepkg}-extract"

  install -D -m644 "LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-data"
  cd data
  install -D -m644 "data.zip" "${pkgdir}/usr/lib/${pkgname}"
  install -D -m644 "VVVVVV.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
