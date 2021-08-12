# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-codeblocks
pkgname=python-${_base}
pkgdesc="Test code blocks in your READMEs"
pkgver=0.11.2
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-setuptools)
checkdepends=(python-pytest-cov)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f476fece6e5bf4284516ecb61fdce01f75906c947bad3b127b8433c62e9cd654ccf700ba70696d834bf4f4556b15152ca66e6e692ec4d8e1c96de85732239aeb')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest -p pytester
}

package() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
