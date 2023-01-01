# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
_name=${pkgname#python-}
pkgver=1.9.20
pkgrel=1
pkgdesc="The Pythonic interface to Subversion"
url="https://pysvn.sourceforge.io/"
depends=('apr' 'python' 'subversion')
makedepends=('python-pycxx' 'python-setuptools')
arch=('i686' 'x86_64')
license=('Apache')
source=("https://downloads.sourceforge.net/project/pysvn/pysvn/V${pkgver}/pysvn-${pkgver}.tar.gz"
       "fix-setup.py.patch")
sha256sums=('2db033f8a8c46379e448903324dc259d2458a16af88b52134543d5dd9047edc7'
            '59b56272570bdf957570cafb57680a4516f8f0dfbf94c301f133410130b0a8be')

prepare() {
  cd "$_name-$pkgver"

  # Remove bundled libs
  rm -rf Import

  # build with fixed module name and no RPATH
  patch -p1 -i "$srcdir/fix-setup.py.patch"
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
