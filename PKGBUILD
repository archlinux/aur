# Maintainer:  Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="posting"
pkgver=2.9.2
pkgrel=1
pkgdesc="The modern API client that lives in your terminal"
arch=('any')
url="https://github.com/darrenburns/${pkgname}"
license=('MIT')
depends=(
  'python>=3.11'
  'python-click>=8.1.7'
  'python-click-default-group>=1.2.4'
  'python-dotenv>=1.0.1'
  'python-httpx>=0.28.1'
  # 'python-linkify-it-py'
  'python-openapi-pydantic>=0.5'
  'python-pydantic>=2.9.2'
  'python-pydantic-settings>=2.4'
  'python-pyperclip>=1.9'
  'python-rich'
  'python-textual>=6.1'
  'python-textual-autocomplete>=4.0.4'
  'python-typing_extensions'
  'python-watchfiles>=0.24'
  'python-xdg-base-dirs>=6.0.1'
  'python-yaml>=6.0.2'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
)
# checkdepends=(
#   'python-pytest>=8.3.1'
#   'python-pytest-cov>=5'
#   'python-pytest-xdist>=3.6.1'
# )
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('72f5931fae361ddd164a12a62f9678752e3c8f207b1d29070d00b8ff53eb79c1')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest tests/ -m "not serial"
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/NOTICE"  \
    "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
}
