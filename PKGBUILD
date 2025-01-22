# Maintainer: Sergey Astanin s<dot>astanin<at>gmail<dot>com
# Contributor: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=tabulate
pkgdesc='Pretty-print tabular data in Python, a library and a command-line utility.'
url="https://github.com/astanin/python-${_name}"
pkgname="python-${_name}-git"
pkgver=0.9.0.r137.537d7b0
pkgrel=1
arch=('any')
makedepends=(python-setuptools python-setuptools-scm)
depends=(python)
#checkdepends=(python-pytest)
license=('MIT')
source=("${_name}::git+${url}.git")
provides=( "python-${_name}" )
conflicts=( "python-${_name}" )
sha1sums=('SKIP')

pkgver() {
  cd "${_name}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_name}"
  rm -rf dist
  python -m build --wheel --skip-dependency-check --no-isolation
}

# Tests are broken ¯\_(ツ)_/¯
# check() {
#   cd "${srcdir}/${_name}"
#   pytest -v --ignore benchmark
# }

package() {
  cd "${srcdir}/${_name}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
