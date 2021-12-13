# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=2.7.0
pkgrel=2
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-pytest-check' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('a48e9a7d6e7c44c52eeff7328c089bc5f15adde3bdd59394e8ad8313c53eced287858d8e3adcea8bf1147b9e37bf8a354ef8d92aa21cad0882d7d49d610a8ab4')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  pytest --ignore testing/test_flake8_actually_runs_checker.py .
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # delete tests folder
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/testing"
}
