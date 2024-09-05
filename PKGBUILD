# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="posting"
pkgname="${_pkgname}-git"
pkgver=1.12.3.r1.g09c842f
pkgrel=1
pkgdesc="The modern API client that lives in your terminal"
arch=('any')
url="https://github.com/darrenburns/${_pkgname}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
# checkdepends=('python-pytest>=8.3.1' 'python-pytest-cov' 'python-pytest-xdist')
depends=('python>=3.11' 'python-click' 'python-xdg-base-dirs' 'python-httpx'
         'python-click-default-group' 'python-pyperclip' 'python-pydantic'
         'python-yaml' 'python-pydantic-settings' 'python-dotenv' 'python-rich'
         'python-textual' 'python-typing_extensions' 'python-textual-autocomplete')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
#  cd "${srcdir}/${_pkgsrc}/src/${_pkgname}"
#  mv types.py posting_types.py
#  find . -type f -name '*.py' -exec sed -i 's/from posting.types/from posting.posting_types/g' {} +
#  find . -type f -name '*.py' -exec sed -i 's/import posting.types/import posting.posting_types/g' {} +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="src/${_pkgname}" pytest tests/ -m "not serial"
# }

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/licenses/NOTICE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE"
}
