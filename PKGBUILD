# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin <ashwinvis+arch_@t_Pr0t0nM4il_c0m>
_base=fluiddyn
pkgname=python-${_base}
pkgver=0.5.2
pkgrel=1
pkgdesc="A framework for studying fluid dynamics using Python"
arch=(any)
url="https://foss.heptapod.net/${_base}/${_base}"
license=('custom:"CeCILL-B"')
depends=(python-matplotlib python-h5netcdf python-psutil python-distro python-qtpy)
optdepends=('python-pyfftw: Calculate FFT')
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy ipython)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('d7813d9871aa464b186fc00ffe946a501d5de46af8c34a8bc960123f3d83811cbdacd509bd0efacee57adec9aef35419709900a35f0db9cbde54316a37873058')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=${_base}/io/test/test_multitiff.py -k 'not image'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
