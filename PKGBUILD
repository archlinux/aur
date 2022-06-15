# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ffcx
pkgname=python-fenics-${_base}
pkgdesc="The FEniCSx Form Compiler"
pkgver=0.4.2
pkgrel=2
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-fenics-ufl python-fenics-basix python-cffi)
makedepends=(python-setuptools python-wheel)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('84860e2ad9a178b7840d6ad0827a38ea177fe4a1c4d56159e7aa284a0e08b64137c1354ceaec3d0974d29874aec6c0a08f1da19a8877d6cebf01cadd6e3588fb')

prepare() {
  # https://github.com/FEniCS/ffcx/pull/468
  sed -i 's/setuptools>=58,<61/setuptools>=58/' ${_base}-${pkgver}/pyproject.toml
  sed -i 's/setuptools >= 58, < 61/setuptools >= 58/' ${_base}-${pkgver}/setup.cfg
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
