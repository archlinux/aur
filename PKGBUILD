# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sen"
pkgname="${_pkgname}-git"
pkgver=0.7.0.r0.gec292b5
pkgrel=1
pkgdesc="Terminal User Interface for containers"
arch=('any')
url="https://github.com/TomasTomecek/${_pkgname}"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
# checkdepends=('python-pytest>=3.4.0' 'python-flexmock')
depends=('python' 'python-urwid' 'python-docker' 'python-urwidtrees')
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

# check () {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgname}-${pkgver%%.r*}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
