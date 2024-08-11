# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="elia"
pkgname="${_pkgname}-git"
pkgver=1.8.0.r0.gd265aa3
pkgrel=1
pkgdesc="A powerful terminal user interface for interacting with large language models"
arch=('any')
url="https://github.com/darrenburns/${_pkgname}"
license=('Apache-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
depends=('python>=3.11' 'python-textual' 'python-sqlmodel>=0.0.9'
         'python-humanize>=4.6.0' 'python-click>=8.1.6'
         'python-xdg-base-dirs>=6.0.1' 'python-aiosqlite>=0.20.0'
         'python-click-default-group>=1.2.4' 'python-greenlet>=3.0.3'
         'python-google-generativeai>=0.5.3' 'python-pyperclip>=1.8.2'
         'litellm>=1.37.19' 'python-tiktoken' 'python-rich' 'python-sqlalchemy'
         'python-pydantic')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  git -C "${srcdir}/${_pkgsrc}" clean -dfx
}

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgname}_chat-${pkgver%%.r*}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
