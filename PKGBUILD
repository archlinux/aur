# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-libtiff-svn
pkgver=r107
pkgrel=1
pkgdesc="A wrapper to the libtiff library to Python using ctypes"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pylibtiff/"
license=('BSD')
depends=('python2' 'libtiff')
provides=('python2-libtiff')
conflicts=('python2-libtiff')
source=($pkgname::"svn+http://pylibtiff.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  sed -i "/NPY_NO_DEPRECATED_API/d" libtiff/src/bittools.c libtiff/src/tif_lzw.c
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1

  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
  cd "$pkgdir/$pydir"
  sed -i "s/\.split()\[:2\]/\.split(None,1)/;\
      s/eval(value)/eval(value,d)/" libtiff/libtiff_ctypes.py
  python2 -c "import libtiff"
  python2 -m compileall libtiff/tiff_h_*
}

