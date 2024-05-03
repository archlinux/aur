# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.6.4
pkgrel=1
pkgdesc="Framework for studying fluid dynamics"
arch=(any)
url="https://foss.heptapod.net/${_base}/${_base}"
license=(CECILL-B)
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-simpleeval)
makedepends=(python-build python-installer python-pdm python-wheel)
optdepends=('python-pyfftw: Calculate FFT'
  'python-pulp: LP problem support'
  'python-mpi4py: MPI support')
# 'python-shtns' 'python-scikit-image' 'python-opencv'
checkdepends=(python-pytest python-scipy ipython)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('1317162795e3577d63d3a739d43936af54382f906aa06bf2f8992265eed43b5e6cfaf0635a675fbe8520faed1ede617ea11632c53084a739ff61785f8c07ae29')

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
