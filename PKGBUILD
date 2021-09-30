# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=triangle
pkgname=python-${_base}
pkgver=20200424
pkgrel=4
pkgdesc="Python bindings to the triangle library"
url="https://github.com/drufat/triangle"
arch=('any')
license=('LGPL3')
depends=('triangle' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-matplotlib: for Matplotlib rendering')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8b9b6ff0636ef09c0c0b5383fd6e5153965bac3767f4311e464cb100a485d3ee79274a2aa2045ee1edf6aa11992f946269d4847308c3bc9f9350b99182175fcb')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  local _py3_ver=$(python3 -c "import sys; print(str(sys.version_info.major)+'.'+str(sys.version_info.minor))")
  cd "${_base}-${pkgver}"
  PYTHONPATH="build/lib.linux-$CARCH-${_py3_ver}:${PYTHONPATH}" \
    PYTHONDONTWRITEBYTECODE=1 \
    pytest -v tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
