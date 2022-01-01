# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tiptop
pkgname=${_base}-cli
pkgdesc="Command-line system monitoring"
pkgver=0.0.17
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-py-cpuinfo python-distro python-psutil python-textual)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
provides=(${_base})
conflicts=(${_base})
source=(${_base}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b5039925a9d4d60574187ec1213c12811a5a1d2a1594bbcf0ee8b10ff1c56b075aebaaa8086d619e8104d593ce1c7e96ff4ac6ee10571a16d784ac1ec88bfe34')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PATH="${PWD}/tmp_install/usr/bin:$PATH" PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks #-k 'not README'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
