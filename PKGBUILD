# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="asyncudp"
pkgname="python-${_pypiname}"
pkgver=0.11.0
pkgrel=1
pkgdesc="Asyncio high level UDP sockets"
arch=(
  'any'
)
url="https://asyncudp.readthedocs.org"
_url="https://github.com/eerimoq/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'python'
)
checkdepends=(
  'python-pytest'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('5e9b7d4d41ba726f8cffb3086e2ab25c397c612da70539d9d91afe7b917eabfc')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
