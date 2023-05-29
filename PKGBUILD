# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sportydatagen
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="Sports activity generator module"
arch=(x86_64)
url="https://gitlab.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-niapy python-sport-activities-features python-sdv python-kaleido-bin python-seaborn) # python-statistics
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest python-mock)
source=(${url}/-/archive/0.2.2/${_base}-${pkgver}.tar.gz)
sha512sums=('8ae9801bbcec2cab63b1e8600f28c0da74008cedbb38b98ba8d59b636265b0f93ab13514ffd778cd15abec71731e1aa9fd30aa88f5be3e513c8c4059a691291d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not create_list_of_all_possible_files and not missing_csv_files and not convert_directory_gpx_files and not convert_directory_tcx_file and not convert_single_gpx_file and not convert_single_tcx_file'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
