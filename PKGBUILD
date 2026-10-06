# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-copier-template-extensions
pkgdesc='Jinja2 extension for Copier to use relative file paths'
pkgver=0.3.4
pkgrel=1
url='https://github.com/copier-org/copier-template-extensions'
license=('ISC')
arch=('any')

conflicts=(
  'python-copier-templates-extensions'
)
replaces=(
  'python-copier-templates-extensions'
)
provides=(
  "python-copier-templates-extensions=$pkgver"
)

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
  "git+https://github.com/copier-org/copier-template-extensions.git#tag=$pkgver"
)
sha256sums=(
  '2cb7529fc39f5d3d27b88c39cba9c46b23ed13df13f483b5f524d7c2647f5ac5'
)

build() {
  cd copier-template-extensions
  python -m build --no-isolation --wheel
}

check() {
  cd copier-template-extensions
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/copier_template_extensions-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd copier-template-extensions
  python -m installer --destdir="$pkgdir" "dist/copier_template_extensions-$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
