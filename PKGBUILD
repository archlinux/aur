# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pypiname="docstring_parser"
pkgname="python-${_pypiname}"
pkgver=0.18.0
pkgrel=1
pkgdesc="Parse Python docstrings. Currently support ReST, Google, Numpydoc-style and Epydoc docstrings."
arch=(
  'any'
)
url="https://github.com/rr-/${_pypiname}"
license=(
  'MIT'
)
depends=(
  'python>=3.8'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'

  'python-hatchling'
)
# checkdepends=(
#   'python-pytest'
# )
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('531cb7a342d55b73fec1ec7acf4def4fea53f7f3ebab322bf5d623ffdd6069e447b7206f48de1f7f235ea90bc6592025fd88f5d9de5455bf0e6770dee1c6c552')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
