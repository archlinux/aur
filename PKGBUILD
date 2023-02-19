# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenics-plotly
pkgname=python-${_base}
pkgdesc="A package for plotting FEniCS objects using plotly"
pkgver=2022.0.0
pkgrel=1
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-dolfin python-ipywidgets python-plotly)
makedepends=(python-setuptools)
checkdepends=(python-pytest openssh)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('456fa4e617b233a5bd28768c0e99812c730ae01a2c9937ef3ffa0f529cf82372b5e3d8596cb4bab7630d835e8f4abdfc58e30d26e08576c83333c58b9859e016')

build() {
  cd ${_base}-${pkgver}
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
