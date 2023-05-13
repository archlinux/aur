# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-jsonargparse
_name=${pkgname#python-}
pkgver=4.21.1
pkgrel=1
pkgdesc='Parsing library for CLI options, configs, and environment variables'
arch=('any')
url='https://github.com/omni-us/jsonargparse'
license=('MIT')
depends=('python-yaml')
makedepends=('python-attrs' 'python-build' 'python-fsspec' 'python-installer' 'python-jsonschema' 'python-pydantic' 'python-requests' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytorch')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c70700a33c16038c6b71d6ddbd7dcc58cf07865f5e0a0f0a7406b90f3a306bcc')

#prepare() {
#  cd "$_name-$pkgver"
#  sed -i '2c\packages = jsonargparse' setup.cfg
#}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPATH="$PWD" python -m unittest discover
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  local _site=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_name-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
