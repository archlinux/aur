# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
_base=dmsh
pkgname=python-${_base}
pkgver=0.2.18
pkgrel=2
pkgdesc="Simple mesh generator inspired by distmesh"
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-scipy)
makedepends=(python-setuptools)
optdepends=('python-matplotlib: for plotting')
checkdepends=(python-perfplot python-colorio python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('755060b6e93eb154c388dfd02e721e78d4ff1c511f566eb4048c2f214162a0df6877bf9e3167dc2035d5390c2f0a3bce92b830ddf114e39fad6d91aa752bccbb')

build() {
	cd "${_base}-${pkgver}"
	export PYTHONHASHSEED=0
	python -c "from setuptools import setup; setup()" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks tests
}

package() {
	cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
