_base=pyfma
pkgname=python-${_base}
pkgdesc="Fused multiply-add (with a single rounding) for Python"
pkgver=0.1.4
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools pybind11)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('68a9607cc16a07f9ca5c52bb63caf73645d94223aa50052ce828abd0322727bf611948513653d8b3250a251b3ce7364a15ad81cb4bd2007a65caa2f18b64be6a')

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
