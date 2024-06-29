# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-copier-templates-extensions
pkgdesc='Jinja2 extension for Copier to use relative file paths'
pkgver=0.3.0
pkgrel=2
url='https://github.com/copier-org/copier-templates-extensions'
license=('ISC')
arch=('any')

depends=('git' 'python-copier' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-pdm-backend')
checkdepends=('python-pytest')

_pypi=copier-templates-extensions
_pyname=copier_templates_extensions
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
  'fix_tests.patch'
)
sha256sums=(
  '48b3f5213ee913b931df40e4e9325b58b9c9a741f1052a7da1b247ed991f5150'
  '2f590a59425163615202573296be7ecea20b11bd27a1239b2b47ab181fd51d17'
)

prepare() {
  cd "$_pypi-$pkgver"

  # Upstream has updated this in the Git version but not in a release yet.
  sed -i 's/pdm-pep517/pdm-backend/' pyproject.toml
  sed -i 's/pdm\.pep517\.api/pdm.backend/' pyproject.toml

  # Also fixed in Git but not released.
  patch -p0 -i "$srcdir/fix_tests.patch"
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
