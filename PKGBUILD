# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: richli <rich at dranek dot com>
# Contributor: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

_pkg=netCDF4
pkgname=python38-${_pkg,,}
pkgver=1.6.1
pkgrel=1
pkgdesc="Python/NumPy interface to the netCDF C library"
arch=(x86_64)
url="https://unidata.github.io/netcdf4-python"
license=(MIT)
depends=(python38-numpy python38-cftime netcdf)
makedepends=(cython python38-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz
        ${pkgname}-fix-netcdf-filters-detection.patch::https://github.com/Unidata/netcdf4-python/pull/1173.patch)
sha256sums=('ba8dc5d65293a99f1afb8c2acf588d903fdfdc1963a62545b677fa2734262a78'
            'cea33cb4b763cc450386c111b61a8c051d834a360ad6ce0487c890dd6dc4ba85')

prepare() {
  # Compressor filters are not packaged currently
  patch -p1 -d ${_pkg}-${pkgver} < ${pkgname}-fix-netcdf-filters-detection.patch || true
}

build() {
  cd ${_pkg}-${pkgver}
  USE_NCCONFIG=1 python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}/test
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="../build/lib.linux-${CARCH}-cpython38-${python_version/./}" python -B ./run_all.py
}

package() {
  cd ${_pkg}-${pkgver}
  USE_NCCONFIG=1 python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
