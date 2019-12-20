# Maintainer: David Scholl <djscholl at gmail dot com>

pkgname=sofastats
pkgver=1.5.3
pkgrel=2
pkgdesc="Statistics Open For All"
arch=('any')
url="http://www.sofastatistics.com/"
license=('custom')
depends=('bash-completion' 'ghostscript' 
         'imagemagick' 'mysql-python' 'pdftk' 
         'python' 'wkhtmltopdf' 'wxpython' 
         'python-matplotlib' 'python-numpy' 'python-psycopg2' 
         'python-requests' 'python-wxpython')
makedepends=('python2-distribute')
replaces=('sofa')
source=("http://downloads.sourceforge.net/project/sofastatistics/sofastatistics/$pkgver/$pkgname-$pkgver.tar.gz" "setup.py" "sofastats.desktop")
md5sums=('efe9ab7978037e7d050e92a4daeaeebf'
         '2b1183516a16275899a7ac40e792f4b7'
         'f267ddd0371a29a3466bec780eda3fd6')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/setup.py ./ 
  touch sofa_main/__init__.py
  python setup.py build 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir
  echo "#!/bin/bash" > sofastats
  echo "/usr/bin/env python2 "\
  "/usr/lib/python$(pacman -Q python | colrm 1 8 | colrm 4)/site-packages/sofastats/start.py "\
  >> sofastats
  chmod a+x sofastats
  install -D sofastats $pkgdir/usr/bin/sofastats 
  install -D copyright $pkgdir/usr/share/licenses/$pkgname/copyright
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

