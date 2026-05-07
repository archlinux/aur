pkgname=python-bd_warehouse-git
pkgdesc="A build123d parametric part collection"
pkgver=v0.2.0.r4.g5be571e
pkgrel=1
arch=(any)
url="https://github.com/gumyr/bd_warehouse"
license=(Apache-2.0)
depends=(
python-build123d
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)
checkdepends=(
python-pytest
)

provides=(python-bd_warehouse)
conflicts=(pythno-bd_warehouse)

source=(git+https://github.com/gumyr/bd_warehouse.git)
b2sums=('SKIP')

pkgver() {
  cd bd_warehouse
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bd_warehouse
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer bd_warehouse/dist/*.whl
  cd bd_warehouse
  python -m pytest \
    --deselect="tests/test_bearings.py::test_bearings[SingleRowTaperedRollerBearing-SKT-M32-53-14.5]"
  deactivate
}

package() {
  cd bd_warehouse
  python -m installer --destdir="$pkgdir" dist/*.whl
}
