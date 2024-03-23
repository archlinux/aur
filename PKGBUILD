# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-xdoctest
_name=${pkgname#python-}
pkgver=1.1.3
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
b2sums=('dcda05cbbc692fe7dd7d6b49d92f980f997e3f5f7025406d2a26019f67486b2dc8f1657d9f8760e3034e6bed9f35d9dd7ab728a07a3e25596dab95327ecc8ba4')

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
