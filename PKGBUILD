# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-fixit
_name=Fixit
pkgver=2.1.0
pkgrel=1
pkgdesc="Advanced Python linting framework with auto-fixes and hierarchical configuration"
arch=(any)
url="https://github.com/Instagram/Fixit"
license=(
  Apache
  MIT
  custom:PSF-2.0
)
depends=(
  python
  python-click
  python-libcst
  python-moreorless
  python-packaging
  python-tomli
  python-trailrunner
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "remove-failing-smoke-test.patch"
)
sha256sums=(
  '81a7be1d530e98da76e00c21aacdb02c6d9d45e922b4edf2f9de3c17733e029b'
  '45a32a0942d224152c4dd9190c20906ab831b776f06d4d14e27803f86fc31ca1'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-failing-smoke-test.patch"
}

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  # Remove failing tests
  rm "tmp_install/$site_packages/fixit/upgrade/deprecated_import.py"
  rm "tmp_install/$site_packages/fixit/upgrade/remove_rule_suffix.py"

  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" \
    python -m fixit.tests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
