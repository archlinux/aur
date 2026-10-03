# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.7.1
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=("any")
url="https://gitlab.com/sardana-org/${_name}"
license=("LGPL-3.0-or-later")
depends=(
  python-taurus itango python-pytango python-lxml python-click
  python-packaging python-pyqtgraph python-numpy
  python-h5py python-scipy python-gobject
)
optdepends=(
  "python-matplotlib: pylab/pyplot plotting from macros"
  "python-pytest: running the bundled tests"
)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=(
  "${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz"
  "importlib-entry-points-resources.patch"
)
sha256sums=('512cd852534b6731786e230a6f3c7daf3231a49cffc2d1312e5041e5e88e9a37'
            'a629fdee4fc4eee33ffa770cac09f675aca0ee406579d11ec56b447ba8c8c881')

prepare() {
  # pkg_resources is not packaged in Arch; use importlib.metadata and
  # importlib.resources for entry points and .ui files
  cd "${_name}-${pkgver}"
  patch -N -p1 --input="${srcdir}/importlib-entry-points-resources.patch"
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
