# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Erol V. Aktay <e.aktay@gmail.com>
pkgname='mwlib'
pkgver='0.15.14'
pkgrel='2'
pkgdesc="Converts MediaWiki articles to pdf, odf, and docbook"
arch=('i686' 'x86_64')
url="http://code.pediapress.com/wiki/wiki"
license=("BSD")
depends=('python2' 'perl' 'python-imaging' 'python2-odfpy' 'python2-flup'
         'python2-pyparsing>=1.4.11' 'twisted' 'python2-dateutil>=1.4.1' 'python2-pypdf>=1.12' 'python2-webob'
         'python2-timelib' 'python2-lockfile' 'python2-gevent' 'python2-bottle' 'python2-qserve'
         'python2-lxml' 'python2-sqlite3dbm' 'python2-roman' 'python2-apipkg' 'python2-py')
optdepends=('texvc'
 'imagemagick'
 'blahtex'
)
makedepends=('re2c' 'python2-setuptools')
changelog=Changelog
source=("http://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.zip"
        license.txt)
md5sums=('137a565db5327f85d2c399dbdec5c92b'
         '62eb6f0bfb7c407593db61962e221844')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Remove simplejson from the setup.py dependency list. If it is not
  # removed, simplejson will be automatically downloaded from PyPi.
  sed -i -e 's/"simplejson>=.*",//' \
	 -e 's/pyparsing>=1.4.11,<1.6/pyparsing>=1.4/' \
	 setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 "$srcdir/license.txt" \
                   "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  # docs
  mkdir -p "$pkgdir/usr/share/docs/"
  cp -a "docs" "$pkgdir/usr/share/docs/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/docs/$pkgname"
}


