# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
pkgver=0.15.8
pkgrel=1
pkgdesc="A rewrite of Python's doctest module"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a16578e6d50398ac80d950bcc9a05131880816e2ff3a15bd1489474e532f9b495d099dcea204d8375c884c6957aaaba9b276fbcb65b5717b2850314453f787f7')

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
