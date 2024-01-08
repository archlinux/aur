# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-json-report
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="A pytest plugin to report test results as JSON"
arch=(any)
url="https://github.com/numirias/pytest-json-report"
license=(MIT)
depends=(
  python
  python-pytest
  python-pytest-metadata
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-flaky
  python-pytest-xdist
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8933f634c094e709e08c381796322e88b3cb699c4c63c3d9d789ad638d8d7cdb')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  pytest \
    --deselect tests/test_jsonreport.py::test_environment_via_metadata_plugin
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
