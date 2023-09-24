# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=triangle
pkgname=python-${_base}
pkgver=20230923
pkgrel=1
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/${_base}"
arch=(any)
license=(LGPL3)
depends=(python-numpy) # triangle
makedepends=(python-build python-installer python-setuptools cython python-wheel git)
optdepends=('python-matplotlib: for Matplotlib rendering')
source=(git+${url}.git?#tag=v${pkgver}
  git+${url}-c.git)
sha512sums=('SKIP'
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
