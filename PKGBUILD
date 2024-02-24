# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="iodata"
pkgname="python-${_name}-git"
pkgver=1.0.0a2.r1341.6b9c6e0
pkgrel=1
pkgdesc="Python library for reading, writing, and converting computational chemistry file formats and generating input files. (git version)"
arch=("any")
url="https://iodata.readthedocs.io/en/latest/index.html"
license=("LGPL-3.0")
makedepends=("git" "python-setuptools")
checkdepends=("python-pytest")
depends=("python-attrs" "python-numpy" "python-scipy")
provides=("python-${_name}")
conflicts=("python-${_name}")
source=("git+https://github.com/theochem/${_name}")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd "${srcdir}/${_name}"
  python -m pytest
}

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git describe --tags --abbrev=0)
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
