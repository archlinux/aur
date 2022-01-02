# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: David McInnis <dave@dave3.xyz>
_base=mahotas
pkgname=python-${_base}
pkgdesc="Computer Vision in Python"
pkgver=1.4.12
pkgrel=1
arch=('x86_64')
url="https://github.com/luispedro/${_base}"
license=('custom')
depends=(python-numpy)
makedepends=(python-setuptools git)
checkdepends=(python-pytest python-pillow python-scipy)
optdepends=('python-imread: for function imread support'
  'python-pillow: for function imread support'
  'freeimage: for functions imread/imsave support')
provides=('mahotas')
source=("git+${url}.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')
validpgpkeys=('6FB8B07A620CC7A7FB5B2AB4110D6C98E760BEF2') # Lu\xed\x73 Pedro Coelho <lpc@cmu.edu>

build() {
  cd "${_base}"
  python setup.py build
}

check() {
  # https://github.com/luispedro/mahotas/issues/129
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${_base}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" python -c "import mahotas as mh; mh.test()"
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
