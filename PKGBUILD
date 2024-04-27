# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=atopile
pkgver=0.2.44
pkgrel=1
pkgdesc="A tool to build electronic circuit boards with code"
arch=(any)
url="https://github.com/atopile/atopile"
license=(Apache-2.0)
depends=(
  python
  python-antlr4
  python-attrs
  python-case-converter
  python-cattrs
  python-click
  python-deepdiff
  python-eseries
  python-flask
  python-flask-cors
  python-gitpython
  python-jinja
  python-natsort
  python-pint
  python-requests
  python-rich
  python-ruamel-yaml
  python-semver
  python-toolz
  python-waitress
)
makedepends=(
  python-build
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1733657bf78d0fdff0cf25d97040433bf1c281d1d3c9605a9465b6d044aecda9')

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
  pytest --override-ini="addopts="
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
