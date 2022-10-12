# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-jsonargparse
_pkg="${pkgname#python-}"
pkgver=4.15.1
pkgrel=2
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=('python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('a2e9b9d44c90005ef969677bec8417d60f78360282d5190c962632c791e565e3')

prepare() {
  cd "$_pkg-$pkgver"
  sed -i '2c\packages = jsonargparse' setup.cfg
}

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  PYTHONPATH="$PWD" python -m unittest discover
}

package() {
  cd "${_pkg}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
