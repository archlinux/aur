# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_py="python2"
_pkg="pycoin"
pkgname="${_py}-${_pkg}"
pkgver=0.92.20220213
pkgrel=1
pkgdesc="Python-based Bitcoin utility library"
arch=(any)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
_ns="richardkiss"
url="https://github.com/${_ns}/${_pkg}"
license=('MIT')
options=(!emptydirs)
_pypi_url="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_url}/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha256sums=(
  'a9bda3b5bfdb1c94a6b6741b6131600a0058d0e0acaf1b1627b48915e103cad7'
)
provides=(
  "${_pkg}2"
)

prepare(){
  cd "${srcdir}/${_pkg}-${pkgver}"

  msg2 'Fixing Python version...'
  find . -type f -print0 \
    | xargs -0 sed -i "s#/usr/bin/python#/usr/bin/${_py}#g"
  find . -type f -print0 \
    | xargs -0 sed -i "s#/usr/bin/env python#/usr/bin/env ${_py}#g"
}

build() {
  cd "${srcdir}/${_pkg}-${pkgver}"

  msg2 'Building...'
  "${_py}" setup.py build
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}"

  msg2 'Installing...'
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1

  msg2 'Renaming binaries...'
  for _bin in $(find "${pkgdir}/usr/bin" -mindepth 1 -type f -printf '%f\n'); do
    mv "${pkgdir}/usr/bin/${_bin}" "${pkgdir}/usr/bin/${_pkg}2-${_bin}"
  done
}
