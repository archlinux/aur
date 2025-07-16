# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.9.0
pkgrel=1
pkgdesc="Framework for studying fluid dynamics"
arch=(any)
url="https://foss.heptapod.net/${_base}/${_base}"
license=(CECILL-B)
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-simpleeval)
makedepends=(python-build python-installer python-pdm-backend python-wheel)
optdepends=('python-pyfftw: Calculate FFT'
  'python-pulp: LP problem support'
  'python-mpi4py: MPI support'
  'python-scikit-image'
  'python-opencv') # 'python-shtns'
checkdepends=(python-pytest python-scipy ipython)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('4086fff873754ed7b2d3fa31affb47cd71fdd6d246eefbcbbd153f42c6be0db414a85e2012bf321d50f6e3ec5cb9aa2e1c38185dc92fd63254792b9882c3d827')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not save_load_image and not serie_1d and not serie_2d'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
