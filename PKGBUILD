# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=perfplot
pkgname=python-${_base}
pkgdesc="Performance analysis for Python snippets"
pkgver=0.9.13
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-rich)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f322c9be8de63fbdb33e45e895b1fe48b342fa4912895deb0da26c86eb7f753bb74066516f8a3b14f685ec12b05214f221231dfea0f3186931056f25d63f8e5b')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
