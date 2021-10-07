_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.6.0
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks) # python-mpmath python-scipy python-meshzoo
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7efcabf76a9ccb2f9539fe7a241b3249bd6d06def4d21855c125abcc08eae9e58cd671d54ca50ab5a69a662cd510b35ecfa5567517f020d27d199c3c6faffbd6')

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
