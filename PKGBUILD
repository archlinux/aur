# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mplx
pkgname=python-${_base}
pkgdesc="Extensions for Matplotlib"
pkgver=0.2.2
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-networkx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fbe98b870ffeea1dee3b007526a71316313d1fc0cc2dc94b97775f964eb5d768d9ba4baa58f85e02886d60fb597257739511a600f95a010b1ba314fbb9182141')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
