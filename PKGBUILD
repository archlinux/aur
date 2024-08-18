# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="posting"
pkgver=1.12.0
pkgrel=1
pkgdesc="The modern API client that lives in your terminal"
arch=('any')
url="https://github.com/darrenburns/${pkgname}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-hatchling')
# checkdepends=('python-pytest>=8.3.1' 'python-pytest-cov' 'python-pytest-xdist')
depends=('python>=3.11' 'python-click' 'python-xdg-base-dirs' 'python-httpx'
         'python-click-default-group' 'python-pyperclip' 'python-pydantic'
         'python-yaml' 'python-pydantic-settings' 'python-dotenv' 'python-rich'
         'python-textual' 'python-typing_extensions' 'python-textual-autocomplete')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cbf2321f6c432590dfdff205486dc5da465847d6baa78b823a2209ffaffb0f9f')

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
#   PYTHONPATH=src pytest tests/ -m "not serial"
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
