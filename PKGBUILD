# Maintainer: Rich Li <rich@dranek.com>
pkgname='python-cyordereddict'
pkgver=0.2.2
pkgrel=1
pkgdesc="Cython implementation of OrderedDict"
url="https://pypi.python.org/pypi/cyordereddict"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('python-setuptools' 'cython')
depends=('python')
checkdepends=('python-nose')
#source=(https://pypi.python.org/packages/source/c/cyordereddict/cyordereddict-"$pkgver".tar.gz)
source=(https://github.com/shoyer/cyordereddict/archive/v"$pkgver".tar.gz)
# Note the PyPI and github sources have different checksums. This is because the github version doesn't include the Cython output, but the PyPI does. Since we're using the github source we therefore have Cython as a makedep.
md5sums=('d78aebebe365fbcba0ab5823be0e06f5')
 
build() {
  cd "$srcdir/cyordereddict-$pkgver"
  python setup.py build --with-cython
}

check() {
  cd "$srcdir/cyordereddict-$pkgver"

  # We use pyvenv to create a virtual environment where the package will be installed, then we can test it. Note that we symlink to the system site-packages so we have (read-only) access to nosetests.
  pyvenv arch_test --system-site-packages
  _venv_python="arch_test/bin/python"

  ${_venv_python} setup.py install
  ${_venv_python} $(which nosetests) cyordereddict ./python3/cyordereddict/test
}
 
package() {
  cd "$srcdir/cyordereddict-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  # MIT License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
