# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur

pkgname=python-palettable
# To build and install the python 2 package as well, use the next line
# instead of the above one.
# pkgname=('python-palettable' 'python2-palettable')

_libname=${pkgname/python-/}
pkgver=3.0.0
pkgrel=1
pkgdesc='Color palettes for Python'
arch=('any')
url='https://jiffyclub.github.io/palettable/'
license=('MIT')

replaces=('python-brewer2mpl')

source=("https://pypi.python.org/packages/31/6c/d95417ead6f8d9fc8ae0d6fbb76fb4107ced7ca949c96a3604bb2d23c401/palettable-3.0.0.tar.gz")
md5sums=('6e430319fe01386c81dbbc62534e3cc4')

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
