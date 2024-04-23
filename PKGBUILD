# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.6.3
pkgrel=1
pkgdesc="Framework for studying fluid dynamics"
arch=(any)
url="https://foss.heptapod.net/${_base}/${_base}"
license=(CECILL-B)
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-qtpy python-simpleeval)
optdepends=('python-pyfftw: Calculate FFT')
makedepends=(python-build python-installer python-pdm python-wheel)
checkdepends=(python-pytest python-scipy ipython)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('f77cd186329573216e304de10e42d0fc4a8fed2c73fe9a3fc8c8a71238ef1d1d523ef1f6ef9ee22ac9800eb10b2bab8110bca6abef9ad7b85a714c0a9f19e480')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not save_load_image and not serie_1d and not serie_2d'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
