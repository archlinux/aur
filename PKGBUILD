# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.6.0
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
sha512sums=('a47b2ddc7ca7ba6dd591b7ac2c6063df4ec5df5d2bf44918a136250fb4bdb1bbc7b620e97382fc2136ab2bdf782f9bccb3cfde24b5f8b540202c9eeca46522ce')

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
