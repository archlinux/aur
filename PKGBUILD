# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MicroStructPy
pkgname=python-${_base,,}
pkgdesc="Microstructure modeling, mesh generation, analysis, and visualization"
pkgver=1.5.9
pkgrel=1
arch=(x86_64)
url="https://github.com/kip-hart/${_base}"
license=(MIT)
depends=(python-aabbtree pybind11 python-lsq-ellipse python-matplotlib python-meshpy
  python-pygmsh python-pyquaternion python-pyvoro-mmalahe python-scipy python-xmltodict)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('007af18687c7f8f4839d7ca6bbf1b922c51968cf1578f80acdff95203875a48a1b0702a113b600c08fc362a64701248320d04485c0b6ab79d95e31be7f1148d3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
