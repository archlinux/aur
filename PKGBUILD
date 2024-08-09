# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_name=${pkgname#python-}
pkgver=24.1.0
pkgrel=1
pkgdesc="Python Application Configuration With Environment Variables"
arch=(any)
url="https://github.com/hynek/environ-config"
license=(Apache-2.0)
depends=(
  python
  python-attrs
)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(
  python-moto
  python-pytest
)
optdepends=('python-boto3: secret extraction from AWS Secrets Manager')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f90fb07cdbfaa3ef26293197a59bbf3f63aa11c4c0058138283bca40b7fe1545')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH"
  pytest \
    --deselect tests/test_packaging.py::TestLegacyMetadataHack
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
