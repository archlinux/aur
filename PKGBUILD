# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=cftime
pkgname=python38-${_pkg}
pkgver=1.6.1
pkgrel=1
pkgdesc="Time-handling functionality from python-netcdf4"
arch=(x86_64)
url="https://unidata.github.io/cftime"
license=(MIT)
depends=(python38-numpy)
makedepends=(cython python38-setuptools)
checkdepends=(python38-pytest)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/Unidata/cftime/archive/v${pkgver}rel/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5440954b446eedc27253a8d437603ca273ca8e59551d016ccf7e9da783a62758')

build() {
  cd ${_pkg}-${pkgver}rel
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}rel
  sed -i '/--cov/d' setup.cfg
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="${PWD}"/build/lib.linux-${CARCH}-${python_version} pytest -vv --color=yes
}

package() {
  cd ${_pkg}-${pkgver}rel
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
