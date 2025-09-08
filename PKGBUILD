# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-xdoctest
_name=${pkgname#python-}
pkgver=1.3.0
pkgrel=1
pkgdesc="A Python package for executing tests in documentation strings"
arch=(any)
url="https://github.com/Erotemic/xdoctest"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
optdepends=(
  'python-pygments: for colorized output'
  'jupyter-nbconvert: for running tests in Jupyter notebooks'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('87a10ae11f94e013191535c45b5e92fb44ed2e3051c4b2d38a7f8eabcf521cd0c5e22a8d40eaa42788e1ecc3b4bc90734f9b29ca1f5df8ef833ca1b3fd39df5e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver

  # tests expect the package to actually be installed, so here's a temporary environment
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH"
  export PATH="$PWD/tmp_install/usr/bin:${PATH}"
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
