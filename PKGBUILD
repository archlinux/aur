# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-memray
_name=${pkgname#python-}
pkgver=1.5.0
pkgrel=1
pkgdesc="A pytest plugin for easy integration of memray memory profiler"
arch=(any)
url="https://github.com/bloomberg/pytest-memray"
license=(Apache)
depends=(
  memray
  python
  python-pytest
)
makedepends=(
  python-build
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(
  python-flaky
  python-pytest-xdist
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4e28f0265102f17b24dbc9df1b4bbfba7c0febedcb3cac36077a8e913e3b823e')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
    python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH" \
    python -m pytest tests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
