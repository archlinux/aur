# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-copier-templates-extensions
pkgdesc='Jinja2 extension for Copier to use relative file paths'
pkgver=0.3.1
pkgrel=1
url='https://github.com/copier-org/copier-templates-extensions'
license=('ISC')
arch=('any')

depends=(
  'python-copier'
  'python-jinja'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pdm-backend'
)
checkdepends=(
  'mkdocstrings'
  'python-griffe'
  'python-pytest'
)

source=(
  "git+https://github.com/copier-org/copier-templates-extensions.git#tag=$pkgver"
)
sha256sums=(
  '1a05039f5c155c98bdcf2cff5c3c18106f81ef437266aa53d05fbf298f6eabce'
)

build() {
  cd copier-templates-extensions
  python -m build --no-isolation --wheel
}

check() {
  cd copier-templates-extensions
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/copier_templates_extensions-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd copier-templates-extensions
  python -m installer --destdir="$pkgdir" "dist/copier_templates_extensions-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
