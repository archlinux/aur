# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=scipyx
pkgname=python-${_base}
pkgdesc="SciPy fixes and extensions"
pkgver=0.0.16
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(BSD)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f4177a6449c51ba752a51d0c8d21b2fa35a614fabda0199da74f074078a775fb2db29f29d69a3f13b07f2b287e6746f600cd4f4fb36f21174f8d8f7d8b1c1970')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
