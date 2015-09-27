pkgbase=('python-sciscipy')
pkgname=('python-sciscipy' 'python2-sciscipy')
pkgver=1.0.1
pkgrel=1
pkgdesc="A Scilab API for Python"
arch=('any')
url="http://forge.scilab.org/index.php/p/sciscipy/"
license=('GPL')
source=("http://forge.scilab.org/index.php/p/sciscipy/downloads/get/sciscipy-${pkgver}.tar.gz"
        "fixlib.diff")
md5sums=('80fa3e4dbd85445c2535e173c24ffc77'
         'SKIP')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cd "$srcdir/sciscipy-$pkgver"
  patch -p1 -i "$srcdir/fixlib.diff"
  /usr/lib/python2.7/Tools/scripts/reindent.py setup.py
  2to3 -w setup.py scilab.py

  cp -r "$srcdir/sciscipy-$pkgver" "$srcdir/sciscipy-$pkgver-py2"

  sed -i "s|PyString_|PyBytes_|g" sciconv_write.c
  sed -i "s|PyInt_|PyLong_|g" sciconv_write.c
}

build() {
  cd "$srcdir/sciscipy-$pkgver-py2"
  python2 setup.py build
  cd "$srcdir/sciscipy-$pkgver"
  python setup.py build
}

check () {
  cd "$srcdir/sciscipy-$pkgver"
#   python2 setup.py test
}

package_python2-sciscipy() {
  depends=('python2-numpy' 'scilab')
  conflicts=('python-sciscipy')

  cd "$srcdir/sciscipy-$pkgver-py2"
  python2 ./setup.py install --prefix=/usr --root="$pkgdir"
}

package_python-sciscipy() {
  depends=('python-numpy' 'scilab')
  conflicts=('python2-sciscipy')

  cd "$srcdir/sciscipy-$pkgver"
  python ./setup.py install --prefix=/usr --root="$pkgdir"
}

# test:
# SCI=/usr/share/scilab LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/server/:/usr/lib/scilab/:/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/ python2 src/sciscipy-1.0.1/tests/test_call.py