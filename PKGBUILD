# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=pyfma
pkgname=python-${_base}
pkgdesc="Fused multiply-add (with a single rounding) for Python"
pkgver=0.1.6
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools pybind11)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('be7ebe4c86b408d573ead5e72cf9e0336a9a00277b0a4ea7f6b6e0f77f57474aa98bfce4622d90cdf4cb977023d022b8f68c2c74a4907aa361247e8029069c9d')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
