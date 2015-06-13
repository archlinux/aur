# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur

pkgname=python-palettable
# To build and install the python 2 package as well, use the next line
# instead of the above one.
# pkgname=('python-palettable' 'python2-palettable')

_libname=${pkgname/python-/}
pkgver=2.1.1
pkgrel=1
pkgdesc='Color palettes for Python'
arch=('any')
url='https://jiffyclub.github.io/palettable/'
license=('MIT')

replaces=('python-brewer2mpl')

source=("https://pypi.python.org/packages/source/p/palettable/palettable-$pkgver.tar.gz")
md5sums=('60adcbda83e1eaa331c5fdc5dfbcc4ff')

build() {
  cd "$srcdir/$_libname-$pkgver"

  rm -rf ../buildpy3; mkdir ../buildpy3
  python setup.py build -b ../buildpy3

  ## python 2 build
  if [ ${#pkgname[@]} -eq 2 ]; then
    rm -rf ../buildpy2; mkdir ../buildpy2
    python2 setup.py build -b ../buildpy2
  fi
}

package_python-palettable() {
  depends=('python' 'python-matplotlib')
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy3 build
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-palettable() {
  depends=('python2' 'python2-matplotlib')
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy2 build
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
