# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-xdoctest
_pkgname="${pkgname#python-}"
pkgver=0.15.9
pkgrel=1
pkgdesc="A rewrite of Python's doctest module"
arch=('any')
url="https://github.com/Erotemic/xdoctest"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6a49fbe7f2535ab86ac7047406fbcc9f7e98c964664a95a115c3d945ba8157e4e70ab8c31edae6faee932cfd5e90201d883d9b4b10e2cea9cdc8ff14b5d52d54')
b2sums=('9980752ad5742a7c4a73418a3ace408c38a6bef6cd43ee5cd1893d6cb195a7c387c5062735b2c903725898ea670e3e6d8e683d4341dcf2dc9e17a2c723107910')

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
