# Maintainer: Matias

_pkgname=python-necpp
pkgname=python-pynec
pkgver=1.7.4
pkgrel=1
pkgdesc="Python antenna simulation module for NEC2++"
arch=(x86_64)
url="https://github.com/tmolteno/python-necpp"
license=(GPL-2.0-only)
depends=(
  python
  python-numpy
)
makedepends=(
  git
  python-setuptools
  swig
)
source=("git+https://github.com/tmolteno/python-necpp.git#commit=99c1533c2063a950b33254f5119e200785147c74")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  git submodule update --init --force
}

build() {
  cd $_pkgname/PyNEC
  ln -sfn ../necpp_src .
  cd ../necpp_src
  make -f Makefile.git
  ./configure --without-lapack
  cd ../PyNEC
  swig -Wall -v -c++ -python PyNEC.i
  python setup.py build
}

package() {
  cd $_pkgname/PyNEC
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir"
  rm -rf "$pkgdir/usr/examples"
  install -Dm644 LICENCE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
