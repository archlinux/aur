# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=pytest-spec
pkgname=(python-pytest-spec)
pkgver=3.2.0
pkgrel=1
pkgdesc="Plugin to display pytest execution output like a specification"
arch=(any)
url='https://github.com/pchomik/pytest-spec'
license=(GPL)
makedepends=(python-poetry python-build python-installer)
depends=(python-six python-pytest)
checkdepends=(python-mock python-pytest-flake8 python-pytest-cov)
source=("pytest-spec-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=(5b906864c3c8fe4be065edd22ea14960d5cc98b65fc3e2c5ee976d6f249d28a4)

prepare() {
  cd "$srcdir/pytest-spec-$pkgver"

  # Let the "check" step not require itself
  sed -i 's/--spec //' setup.cfg

  # Remove tests that aren't tests for pytest-spec
  rm -rf test/test_{formats,results}

  # Avoid installing the license file in site-packages
  sed -i /LICENSE.txt/d pyproject.toml
}

build() {
  cd "$srcdir/pytest-spec-$pkgver"
  python -m build -wnxo dist
}

check() {
  cd "$srcdir/pytest-spec-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/pytest-spec-$pkgver"
  python -m installer --destdir="$pkgdir" \
    "dist/pytest_spec-$pkgver-py2.py3-none-any.whl"
}
