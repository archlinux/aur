# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
pkgver=0.15.10
pkgrel=1
pkgdesc="A rewrite of Python's doctest module"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('18c1a2774ae9331582610e3459a02f4e4de838218e7250af071570b2318f4c14330084b9fb903d88651fc40a4ba12b686ee6f2ca165edd8155e908ae4992a840')
b2sums=('4836b773c3cf664c825433199b13ab7d3fe2c68538517bf5594797ad3f2f894d0132034fdafbc4502a00ec7393c19473fafe15fcf0257e3565592dc9907e3d71')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"

  # tests expect the package to actually be installed, so here's a temporary environment
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH"
  export PATH="$PWD/tmp_install/usr/bin:${PATH}"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
