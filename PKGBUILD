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
_pkgsrc="${_pypiname}-${pkgver}"
source=(
  "${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
  # "${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz.sigstore.json"
)
sha256sums=('8552191013cf8473706a5575d03bc525a8d96a197bf3d747370e07bcd04b77fd')

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
