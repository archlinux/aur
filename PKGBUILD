# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlmodel
_pkgname="${pkgname#python-}"
pkgver=0.0.4
pkgrel=1
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
arch=('any')
url="https://sqlmodel.tiangolo.com"
license=('MIT')
depends=('python' 'python-sqlalchemy' 'python-pydantic' 'python-sqlalchemy2-stubs')
makedepends=('python-poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/sqlmodel/archive/$pkgver.tar.gz")
b2sums=('85e337d75de4aeb80a4bfaf44914d3a69229edceb5ee2f0af496c57db45b3c93e260b327c3e41c2415c8f3ecffa4aa72ad53ae5cb64890d8c0589b0bd691f45d')

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
