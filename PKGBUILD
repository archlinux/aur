# Maintainer: a821 ( ) mail de
# Contributor: David Runge <dvzrv@archlinux.org>

_name=pytest-html
pkgname=python-pytest-html
pkgver=4.2.0
pkgrel=1
pkgdesc="Plugin for generating HTML reports for pytest results"
arch=(any)
url="https://github.com/pytest-dev/pytest-html"
license=(MPL-2.0)
depends=(
  python
  python-jinja
  python-pytest
  python-pytest-metadata
)
makedepends=(
  npm
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-assertpy
  python-beautifulsoup4
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
)
optdepends=(
  'python-ansi2html: for converting ansi'
)
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('3c54c3f7303477473fbf17f80cd1b071195a9df11cf483fd64da18921d3e34aa4a97dea37a3af4fc2ed6b87d347bb3046daaacb5e9d7033f9823e287085b93a3')
b2sums=('d44cebd7c8a9c320063701bd37193149f0c903c42266af8172cab42f140e42188a37367ec802aac1e2cb025a05661777480cff59d944df1fda4c350f4a8c4518')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}" testing/test_unit.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
