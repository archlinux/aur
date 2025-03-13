# Maintainer: David Scholl <djscholl at gmail dot com>

pkgname=sofastats
pkgver=1.5.7
pkgrel=1
pkgdesc="Statistics Open For All"
arch=('any')
url="http://www.sofastatistics.com/"
license=('custom')
depends=('bash-completion' 'ghostscript'
         'imagemagick' 'python-mysqlclient' 'pdftk'
         'python' 'wkhtmltopdf' 'python-wxpython'
         'python-matplotlib' 'python-numpy' 'python-psycopg2'
         'python-requests' 'python-wxpython')
makedepends=('python-distribute')
replaces=('sofa')
source=("http://downloads.sourceforge.net/project/sofastatistics/sofastatistics/$pkgver/"$pkgname"-"$pkgver".tar.gz" "setup.py" "sofastats.desktop")
md5sums=('ddc3a9afef6ae06ff55fee27e6399743'
         '687f5aa90925097ad727bbf1f1b6730b'
         'f267ddd0371a29a3466bec780eda3fd6')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/setup.py ./
  touch sofa_main/{__init__.py,dbe_plugins/__init__.py}
  python setup.py build
}
package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
  echo "#!/bin/bash" > sofastats
  echo "/usr/bin/env python "\
  "/usr/lib/python$(pacman -Q python | colrm 1 8 | colrm 4)/site-packages/sofastats/start.py "\
  >> sofastats
  chmod a+x sofastats
  install -D sofastats $pkgdir/usr/bin/sofastats
  install -D copyright $pkgdir/usr/share/licenses/$pkgname/copyright
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

