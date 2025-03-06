# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="posting"
pkgver=2.4.1
pkgrel=1
pkgdesc="The modern API client that lives in your terminal"
arch=('any')
url="https://github.com/darrenburns/${pkgname}"
license=('MIT')
depends=('python>=3.11' 'python-click>=8.1.7' 'python-click-default-group>=1.2.4'
         'python-dotenv>=1.0.1' 'python-httpx>=0.27.2' 'python-linkify-it-py'
         'python-pydantic>=2.9.2' 'python-pydantic-settings>=2.4' 'python-pyperclip>=1.9'
         'python-rich' 'python-textual' 'python-textual-autocomplete' 'python-typing_extensions'
         'python-watchfiles>=0.24' 'python-xdg-base-dirs>=6.0.1' 'python-yaml>=6.0.2')
makedepends=('python-build' 'python-hatchling' 'python-installer')
# checkdepends=('python-pytest>=8.3.1' 'python-pytest-cov>=5' 'python-pytest-xdist>=3.6.1')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a09ec982adc3246e86b0973881951abbf23204d776faf8f72a300db0e09e2e91')

# prepare() {
#   cd "${srcdir}/${_pkgsrc}/src/${pkgname}"
#   mv types.py posting_types.py
#   find . -type f -name '*.py' -exec sed -i 's/from posting.types/from posting.posting_types/g' {} +
#   find . -type f -name '*.py' -exec sed -i 's/import posting.types/import posting.posting_types/g' {} +
# }

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="src/${pkgname}" pytest tests/ -m "not serial"
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" "LICENSE"
  ln -vsf "${site_packages}/${_pkgsrc}.dist-info/licenses/NOTICE"  "NOTICE"
}
