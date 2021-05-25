# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.6.2
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-setuptools' 'python-dephell')
#checkdepends=('python-pytest' 'python-pytest-check' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('726f83f16d985525ae8a3e4b834e8d1cb0f0ce2ece3002628135f30d1562a1b9cacf3e9e0b1ecfb7037282f9911409bd0cc6a8b039cfc14051f096c9f2bf6a42')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

#check() {
#  cd "$_pkgname-$pkgver"
#  pytest --ignore testing/test_flake8_actually_runs_checker.py .
#}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # delete unnecessary files/folders
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/testing"
}
