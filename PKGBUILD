# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=python-datrie-git
pkgver=0.8.r2.gfa3cfc3
pkgrel=1
pkgdesc="Fast, efficiently stored Trie for Python. Uses libdatrie"
arch=('x86_64')
url="https://github.com/pytries/datrie"
license=('LGPL')
depends=('libdatrie')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest-runner' 'python-hypothesis')
conflicts=("python-datrie" "datrie" "datrie-git")
source=("git+https://github.com/pytries/datrie.git")
sha512sums=('SKIP')

prepare() {
  cd $srcdir/datrie
  git submodule init
  git submodule update
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  #sed -i 's|../libdatrie/||g' src/cdatrie.pxd
  #sed -i 's|../libdatrie/||g' src/cdatrie.c
  #sed -i 's|../libdatrie/||g' src/datrie.c
}

build() {
  cd $srcdir/datrie
  ./update_c.sh
  python setup.py build
}

check() {
  msg2 "Running tests on python-datrie"
  cd $srcdir/datrie
  python setup.py pytest
}

package() {
  cd $srcdir/datrie
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
