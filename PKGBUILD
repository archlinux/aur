# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=markdown-pytest
pkgname=python-$_name
pkgver=0.6.6
pkgrel=1
pkgdesc='Pytest plugin for runs tests directly from Markdown files'
arch=('any')
url='https://github.com/mosquito/markdown-pytest'
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
optdepends=('python-pytest: pytest'

            'python-pytest-asyncio: async')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ccc074a060cd9e3e95e93507d838edfbf01000140b9373123c97f1732d4c8312')

prepare() {
  cd "$_name-$pkgver"
  # Set the version from the release tag, as upstream's publish workflow does
  sed -i "s/^version = .*/version = \"$pkgver\"/" pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH=. test-env/bin/python -P -m pytest "${pytest_options[@]}" README.md tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
