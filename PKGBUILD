# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest_metadata
pkgname=python-pytest-metadata
pkgver=3.0.0
pkgrel=1
pkgdesc="Plugin for accessing test session metadata"
arch=(any)
url="https://github.com/pytest-dev/pytest-metadata"
license=(MPL2)
depends=(
  python
  python-pluggy
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('8dd33362ad1e474464f1a762091fa980bc92e9e34f64c7960be36c4875bb585447a363b031d0e8326cb406cb78d0733d99db180f466133a84c1cd080e07ba6e1')
b2sums=('50f4b0dc1bbed339b0ab0fa5075218f5b8ec5cae873729d1000e34eb2d54d8694580efa3b0884a45b0aeb1ec0edfd41858a287ec8a7efa47adf867b6c8762c1f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _test_dir='test_dir'

  cd $_name-$pkgver
  # install to temporary location, as entrypoints are used
  python -m installer --destdir="$_test_dir" dist/*.whl
  export PYTHONPATH="$_test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
