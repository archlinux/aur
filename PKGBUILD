# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="iodata"
pkgname="python-${_name}-git"
pkgver=1.0.0a5.r1575.cd68593
pkgrel=1
pkgdesc="Python library for reading, writing, and converting computational chemistry file formats and generating input files. (git version)"
arch=("any")
url="https://iodata.readthedocs.io/en/latest/index.html"
license=("LGPL-3.0")
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-setuptools-scm"
  "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-xdist")
depends=("python-attrs" "python-numpy" "python-scipy" "python-sympy")
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/theochem/${_name}")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "${srcdir}/${_name}"

  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"

  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
}

check() {
  cd "${srcdir}/${_name}"

  # these require the package to be installed
  /usr/bin/python -m pytest -k 'not test_scripts'
}

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git describe --tags --abbrev=0 | tr -d 'v')
  _parent_major_ver=$(echo "${_parent_ver}" | cut -d "." -f 1)
  _parent_minor_ver=$(echo "${_parent_ver}" | cut -d "." -f 2)
  _parent_patch_ver=$(echo "${_parent_ver}" | cut -d "." -f 3)
  printf "%s.%s.%s.r%s.%s" \
         "${_parent_major_ver}" \
         "${_parent_minor_ver}" \
         "${_parent_patch_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}
