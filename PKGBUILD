# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

# Patches are found on the News page.
# http://ploticus.sourceforge.net/doc/news.html

set -u
pkgname='ploticus'
_pkgver='2.42'
pkgver="${_pkgver}"
pkgrel='2'
pkgdesc='produce plots and graphs in GIF, PNG, PostScript, SVG from CSV like data'
arch=('i686' 'x86_64')
url='http://ploticus.sourceforge.net/doc/welcome.html'
license=('GPL')
depends=('gd' 'libpng' 'libjpeg' 'freetype2' 'zlib' 'libx11')
makedepends=('patch')
source=("http://prdownloads.sourceforge.net/sourceforge/${pkgname}/pl241src.tar.gz"
        "Makefile2.41.patch"
        "Makefile2.42.patch")
if [ "${pkgver}" = '2.42' ]; then
  source+=(
        "http://prdownloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}${_pkgver/./}_src.tar.gz"
        'http://ploticus.sourceforge.net/download/execline.c.gz'
        'http://ploticus.sourceforge.net/download/init.c'
  )
  pkgver="${pkgver}.r201406"
fi
sha256sums=('ecccb6afcf0008d5b31da2e9e74c448564101eb7b9bbde758a3dca1f2dc8c580'
            'f0b1acc10a35b1d3c4268ee67c2520af36044991e289d538c1cb5b7bc406d4e4'
            '07212e7e4695c34df21f73bfa0b5c1efb3e765eb070dbe074b715f1f56f31c41'
            '3f29e4b9f405203a93efec900e5816d9e1b4381821881e241c08cab7dd66e0b0'
            '1be5ec081977dcd6a60407999eb317f42325fef7889c5c542ec649686119cde3'
            '9af92c8a7a0795cbf09aa69af336c248e1b65e42a52e5334cc208543ab803159')

prepare() {
  set -u
  cd pl*${_pkgver/./}*/src/
  sed -i -e 's:^\(#define PREFABS_DIR "\)\(".*\)$:\1/usr/share/ploticus\2:g' 'pl.h'
  patch -Np2 -i "${srcdir}/Makefile${_pkgver}.patch"
  if [ "${_pkgver}" = '2.42' ]; then
    cp -p "${srcdir}"/*.c .
  fi
  set +u
}

build() {
  set -u
  cd pl*${_pkgver/./}*/src/
  make -s -j "$(nproc)" CC='gcc -O' EXE=$pkgname
  set +u
}

package() {
  set -u
  cd pl*${_pkgver/./}*/src/
  install -Dpm755 $pkgname -t "${pkgdir}/usr/bin/"
  cd "${srcdir}"/pl2*/src/
  install -Dpm644 '../man/man1/pl.1' -t "${pkgdir}"/usr/share/man/man1/pkgname.1
  install -Dpm644 '../prefabs'/* -t "${pkgdir}/usr/share/ploticus/"
  set +u
}
set +u
