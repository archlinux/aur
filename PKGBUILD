# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=triangle
pkgname=python-${_base}
pkgver=20250106
pkgrel=1
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/${_base}"
arch=(any)
license=(LGPL-3.0-or-later)
depends=(python-numpy) # triangle
makedepends=(python-build python-installer python-setuptools cython python-wheel git)
optdepends=('python-matplotlib: for Matplotlib rendering')
source=(git+${url}.git?#tag=v${pkgver}
  git+${url}-c.git)
sha512sums=('4def0e7226f70db9d35f3509f045c4e33c188d74724e5da7488ef0db4b49d56d4f0cca29a22aab64f752502dd9f6d3392be4e999c32cba8c70cb6e7e34be1476'
            'SKIP')

prepare() {
  cd ${_base}
  git submodule init
  git config submodule.libs/c.url "${srcdir}/${_base}-c"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
