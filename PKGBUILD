# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-lief-git
pkgver=0.13.0.r246.g002f356
pkgrel=1
pkgdesc="LIEF - Library to Instrument Executable Formats"
arch=('x86_64')
url="https://github.com/lief-project/lief"
license=('Apache')
depends=(
python
pybind11
)
makedepends=(
cmake
python-setuptools
python-build
python-installer
python-wheel
ninja
python-tomli
python-scikit-build-core
python-pydantic
)
provides=(python-lief)
conflicts=(python-lief)
source=('git+https://github.com/lief-project/LIEF.git')
sha256sums=('SKIP')

pkgver(){
  cd LIEF
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd LIEF
  sed 's,^setuptools==.*,setuptools,' -i api/python/build-requirements.txt
  sed 's,^scikit-build.*,scikit-build,' -i api/python/build-requirements.txt
  sed 's,^wheel.*,wheel,' -i api/python/build-requirements.txt
}

build() {
  cd LIEF
  PYTHONPATH="$PWD" python -m build api/python --wheel --no-isolation
}

package() {
  cd LIEF
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" api/python/dist/*.whl
}
