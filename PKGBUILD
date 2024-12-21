# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.8.0
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
sha512sums=('3593bc8f064088a01347be6a5dc82aaef810f9db836f543cf663ec860f4695212ce45bba0eae8ff188302cdf8f0eba206c53643600a13cc94f2b39ebbc4df7ae')

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
