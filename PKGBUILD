# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="coorx"
pkgname="python-${_pypiname}"
pkgver=2.0.1
pkgrel=1
pkgdesc="Object-oriented linear and nonlinear coordinate system transforms"
arch=(
  'any'
)
url="https://github.com/campagnola/${_pypiname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'python'
  'python-numpy'
  'python-pyqtgraph'
  'python-scipy'
  'python-vispy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-setuptools>=42'
)
checkdepends=(
  'python-pytest'
  'python-pillow'
  'jupyter-nbclient'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('a06185316b18cf9a8498b56e2b09645beee482f0d018f143c6ed31d5910e6fc74bde8094db0b4e327dff6e9779e46b5b364ba3dbd971efccee201accf0a04f07')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest -k "not test_image and not test_systems"
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
