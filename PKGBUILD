# $Id: PKGBUILD 117985 2014-08-27 20:21:39Z ronald $
# Maintainer: Ronald van Haren  <ronald.archlinux.org>

pkgname=freevo
pkgver=1.9.0
pkgrel=14
pkgdesc="An open-source home theatre PC platform"
url="http://freevo.sourceforge.net/"
license=('GPL2')
arch=('any')
depends=('lame' 'flac' 'faad2' 'cdparanoia' 'vorbis-tools' 'fbset'
         'smpeg' 'python2-pillow' 'python2-pysqlite-legacy' 'lsdvd'
         'python2-twisted' 'python2-numpy' 'python2-pygame' 'kaa-metadata'
         'kaa-imlib2' 'python2-beautifulsoup3' 'python2-html5lib')
optdepends=('mplayer: most features'
            'xine-lib: can be used instead of mplayer'
            'tvtime: watching tv'
            'xmltv: parsing online tv guides')
install=freevo.install
options=('docs')
source=("http://downloads.sourceforge.net/freevo/$pkgname-$pkgver.tar.gz"
        'freevo.desktop'
        'imdb-html5lib.patch')
sha1sums=('0533a2d4ff8a7b09b3b233fdf303ff56bda22d16'
          '5f6e76dc58496f072aca29257c24be5ffa9c6c7d'
          '57e1099527603500c594fbffa2cb7233b636eed1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # patch from http://sourceforge.net/tracker/index.php?func=detail&aid=2924872&group_id=46652&atid=446895
  patch -Np0 -i ../imdb-html5lib.patch

  # remove check for python-imaging
  sed -i "/'Image'/d" setup.py

  # fix executable for python 2.7
  sed -i -e 's:\(#!/usr/bin/env[ ]\+python$\|#!/usr/bin/python$\):\12:g' \
        $(find "${srcdir}/${pkgname}-${pkgver}" -regex ".*.py\|.*.recipe")
  sed -i "s:python:python2:g" "${srcdir}/${pkgname}-${pkgver}"/src/www/htdocs/downloadurl
  sed -i "s|search = ('python', 'python2')|search = ('python2', 'python2.7')|" "${srcdir}/${pkgname}-${pkgver}"/freevo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py install --prefix="${pkgdir}"/usr

  install -Dm644 local_conf.py.example "${pkgdir}"/usr/share/doc/freevo/local_conf.py.example

  # install .desktop file and icon
  install -Dm644 share/icons/misc/freevo_app.png \
        "${pkgdir}"/usr/share/pixmaps/freevo.png
  install -Dm644 ../freevo.desktop \
        "${pkgdir}"/usr/share/applications/freevo.desktop

  # fix executable for python 2.7
#  sed -i -e 's:\(#!/usr/bin/env[ ]\+python$\|#!/usr/bin/python$\):\12:g' \
#        $(find "${srcdir}/${pkgname}-${pkgver}" -regex ".*.py\|.*.recipe")
#  sed -i "s:python:python2:g" "${srcdir}/${pkgname}-${pkgver}"/src/www/htdocs/downloadurl
#  sed -i "s|search = ('python', 'python2')|search = ('python2', 'python2.7')|" "${srcdir}/${pkgname}-${pkgver}"/freevo
}
