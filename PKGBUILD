# Maintainer : stickynotememo <samk26633@gmail.com>
# Contributor: loqs (arch forums)
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
# Contributor: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
_name=${pkgname#python-}
pkgver=1.9.25
pkgrel=1
pkgdesc="The Pythonic interface to Subversion"
url="https://pysvn.sourceforge.io/"
depends=('apr' 'python' 'subversion')
makedepends=('python-pycxx' 'python-setuptools')
arch=('i686' 'x86_64')
license=('Apache')
source=("https://downloads.sourceforge.net/project/pysvn/pysvn/V${pkgver}/pysvn-${pkgver}.tar.gz"
       "fix-setup.py.patch")
sha256sums=('33d2f352bffa15949458541d18ce84c35ff2484e42fd0edc3578be8c66be25d6'
            'c82137919f3a766f0de4c4807fe079caa8f12b05c37dddbe63734a96bcd60f4e')

prepare() {
  cd "$_name-$pkgver"

  # Remove bundled libs
  rm -rf Import

  # build with fixed module name and no RPATH
  patch -p1 -i "$srcdir/fix-setup.py.patch"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  ln -s /usr/include/python$python_version/cxx Source/CXX
}

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

check() {
  cd "$_name-$pkgver/Tests"

  LC_ALL=en_US.UTF-8 make
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
# vim: set ts=2 sw=2 et:
