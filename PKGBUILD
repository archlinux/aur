# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="openapi-pydantic"
pkgname="python-${_name}"
_commit_rel="82fd769f2820f6ff2acf650f551a97a7b8fbe189" # 0.5.1
_commit="0766d599bbe9bccda12b6ede069647c7bef2299f" # r37
pkgver="0.5.1+r37+g${_commit::7}"
pkgrel=3
pkgdesc="Modern, type-safe OpenAPI schemas in Python using Pydantic 1.8+ and 2.x"
arch=(
  'any'
)
url="https://github.com/mike-oakley/${_name}"
license=(
  'MIT'
)
depends=(
  'python>=3.9'
  'python-pydantic>=1.8'
  'python-pydantic-core'
)
makedepends=(
  'python-build'
  'python-hatchling>=1.26'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest>=8.3.5'
  'python-openapi-spec-validator'
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${url}/archive/${_commit}/${_pkgsrc}.tar.gz"
)
sha256sums=('8b4091f4a2f1613a05aa88a66ad72e0b1c3da7781be1a207d0d7edff4483ffcf')

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

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_name//-/_}-${pkgver%%+r*}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
