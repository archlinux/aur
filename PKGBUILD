# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlmodel
_pkgname="${pkgname#python-}"
pkgver=0.0.3
pkgrel=1
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
arch=('any')
url="https://sqlmodel.tiangolo.com"
license=('MIT')
depends=('python' 'python-sqlalchemy' 'python-pydantic' 'python-sqlalchemy2-stubs')
makedepends=('python-poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/sqlmodel/archive/$pkgver.tar.gz")
b2sums=('3ce9ce49cec137d66ecbce8be8ed115e81680188cc017ad8e96bb15420daec6fd9f840bc6d549f4362f05c53823e0b5688b80f8b2f9426a2b465b47089212f34')

build() {
  cd "$_pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$_pkgname-$pkgver"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl

  # delete direct_url.json
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -vf "$pkgdir$site_packages"/*dist-info/direct_url.json

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
