# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tiptop
pkgname=${_base}-cli
pkgdesc="Command-line system monitoring"
pkgver=0.0.19
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
sha512sums=('cde52272a909cd0ce634f03aca1bddf5a9d10dddf6d3daa8e6d42062d6aae472a3fc37a195b8814ffdfb569d865dc6558000a0c75a62ff65beb4b24a0b7b56d9')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PATH="${PWD}/tmp_install/usr/bin:$PATH" PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
