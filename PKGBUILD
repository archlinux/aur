# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openapi-pydantic"
pkgname="python-${_name}"
pkgver=0.5.1
pkgrel=1
pkgdesc="Modern, type-safe OpenAPI schemas in Python using Pydantic 1.8+ and 2.x"
arch=('any')
url="https://github.com/mike-oakley/${_name}"
license=('MIT')
depends=(
  'python>=3.9'
  'python-pydantic>=1.8'
  'python-pydantic-core'
)
makedepends=(
  'python-build'
  'python-poetry-core'
  'python-installer'
)
checkdepends=(
  'python-pytest>=8.3.5'
  'python-openapi-spec-validator'
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a74bb7759592d2e5d9999b6e20fd67487dc135391f75fb1d78e5501b674cad7')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name//-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
