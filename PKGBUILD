# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_name=${pkgname#python-}
pkgver=23.2.0
pkgrel=3
pkgdesc="Python Application Configuration With Environment Variables"
arch=(any)
url="https://github.com/hynek/environ-config"
license=(Apache)
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
sha256sums=('b717dbdf671a79b8c73427bc2c8eeaabed7abf36252281accfd5db25b50db21a')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH"
  pytest \
    --deselect tests/test_packaging.py::TestLegacyMetadataHack
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
