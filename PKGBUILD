# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-copier-templates-extensions
pkgdesc='Jinja2 extension for Copier to use relative file paths'
pkgver=0.3.0
pkgrel=1
url='https://github.com/copier-org/copier-templates-extensions'
license=('custom:ISC')
arch=('any')

# python-copier tries to import the git command from python-plumbum, which fails
# if git is not installed. This should be in the dependencies of python-copier,
# but put it here for now until that is fixed.
depends=('git' 'python-copier' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-pdm-pep517')
checkdepends=('python-pytest')

_pypi=copier-templates-extensions
_pyname=copier_templates_extensions
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '48b3f5213ee913b931df40e4e9325b58b9c9a741f1052a7da1b247ed991f5150'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Initially, PEP639 used a new license-expression field, but a later revision
  # reused the existing license field.
  sed -i -e "s/license-expression/license/" pyproject.toml
}

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
