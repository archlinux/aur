# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-xdoctest
_name=${pkgname#python-}
pkgver=1.1.5
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
b2sums=('0bbcd09464cc48d6450c746fc341892401bfa91a18be45ab340d291a4001a71f6d5a0fca6b3a7e869c2c34ce008e992fdac62fdd898a941659017e9bf68b7ae9')

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
