# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=atopile
pkgver=0.2.19
pkgrel=1
pkgdesc="A tool to build electronic circuit boards with code"
arch=(any)
url="https://github.com/atopile/atopile"
license=(Apache-2.0)
depends=(
  python
  python-antlr4
  python-attrs
  python-click
  python-gitpython
  python-jinja
  python-natsort
  python-omegaconf
  python-pint
  python-requests
  python-rich
  python-ruamel-yaml
  python-semver
  python-toolz
  python-yaml
)
makedepends=(
  python-build
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('350dfffb4a85d8fea3ccf14efdb2fbcb5bd70e30b32d1f98f85960a8f45155bc')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest --override-ini="addopts=" \
    --deselect tests/test_assertions.py::test_follow_the_dots
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
