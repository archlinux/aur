# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenics-plotly
pkgname=python-${_base}
pkgdesc="A package for plotting FEniCS objects using plotly"
pkgver=2021.0.1
pkgrel=2
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-dolfin python-plotly)
makedepends=(python-setuptools)
checkdepends=(python-ipywidgets python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bcaeca430d149b8ec5ed855dc0994c13877584bb4835c3e05b3b862a949d6b7c874f5f24d7b4802e9f4660e73bb443474ebe38d4202f19697d7445ded22fd032')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  PYTHONPATH="${srcdir}/${_base}-${pkgver}/build/lib/${_base/-/_}:${PYTHONPATH}" python ${_base}-${pkgver}/tests/test_fenics_plotly.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
